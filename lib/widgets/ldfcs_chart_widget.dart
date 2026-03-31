import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';

class LdfcsScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

class LdfcsChartWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String? description;
  final List<dynamic>? hourlyWeather;

  const LdfcsChartWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    this.description,
    this.hourlyWeather,
  });

  @override
  State<LdfcsChartWidget> createState() => _LdfcsChartWidgetState();
}

class _LdfcsChartWidgetState extends State<LdfcsChartWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledToCurrentHour = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentHour() {
    if (!_scrollController.hasClients || _hasScrolledToCurrentHour) return;
    
    final now = DateTime.now();
    final hour = now.hour + (now.minute / 60.0);
    
    // We need the total width of the scrollable content
    final maxScroll = _scrollController.position.maxScrollExtent;
    final viewportWidth = _scrollController.position.viewportDimension;
    final totalWidth = maxScroll + viewportWidth - 32; // subtracting horizontal padding (16*2)

    if (totalWidth <= 0) return;

    final hourWidth = totalWidth / 24;
    final targetOffset = (hourWidth * hour) - (viewportWidth / 2);
    
    _scrollController.animateTo(
      targetOffset.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    _hasScrolledToCurrentHour = true;
  }

  void _showFullscreen(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: AppColors.surface,
        child: Scaffold(
          backgroundColor: AppColors.surface,
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.description != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.description!,
                      style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                    ),
                  ),
                _buildChartContent(height: 512, isFullscreen: true),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildChartContent({required double height, bool isFullscreen = false}) {
    return SizedBox(
      height: height + (widget.hourlyWeather != null ? 85 : 20), // approx header height
      child: ScrollConfiguration(
        behavior: LdfcsScrollBehavior(),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LayoutBuilder to get the image width for headers
                // Note: We use a placeholder width if not loaded, but ideally we wait for image loading
                IntrinsicHeight(
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        imageBuilder: (context, imageProvider) {
                          // Once image is loaded, we can trigger scroll
                          WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentHour());
                          
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              // Calculate width based on image aspect ratio and fixed height
                              // We use Image.network just for sizing if needed or rely on a fixed AR
                              // BirdNET-Pi LDFCS are typically 24h wide.
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // We need a way to know the width here. 
                                  // Let's use a workaround: The image widget will determine the row width.
                                  // We'll wrap the image and header together.
                                  Builder(builder: (context) {
                                    // This is tricky because header needs width but image determines it.
                                    // We can use a trick: IntrinsicWidth? No, that's heavy.
                                    // Better: The image has a height, so we wrap it.
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Weather header - will be sized by Column/Row
                                        // We'll use a listener or simply rely on image being loaded.
                                        _buildWeatherHeaderFromImage(height),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            color: Colors.black,
                                            height: height,
                                            child: Image(image: imageProvider, fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              );
                            }
                          );
                        },
                        placeholder: (context, url) => Container(
                          width: MediaQuery.of(context).size.width - 64,
                          height: height,
                          color: AppColors.cardElevated,
                          child: Center(child: CircularProgressIndicator(color: AppColors.primaryLight, strokeWidth: 2)),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: MediaQuery.of(context).size.width - 64,
                          height: height,
                          color: AppColors.cardElevated,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.broken_image, size: 48, color: AppColors.textHint),
                              const SizedBox(height: 12),
                              const Text("Chart data not yet available"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Improved header builder that uses the image height to maintain consistency
  Widget _buildWeatherHeaderFromImage(double imageHeight) {
    if (widget.hourlyWeather == null || widget.hourlyWeather!.isEmpty) return const SizedBox.shrink();
    
    // We'll use a fixed AR for the LDFCS (usually they are quite wide)
    // Actually, we can just use the natural width of the image.
    // To do that, we need to know it. 
    // Let's use a simpler approach: the header is a Row of 24 cells.
    // We'll wrap the Image and this Row in an IntrinsicWidth.
    
    return IntrinsicWidth(
      child: Column(
        children: [
          _buildWeatherHeaderCells(imageHeight),
        ],
      ),
    );
  }

  Widget _buildWeatherHeaderCells(double imageHeight) {
    // This is still hard because we don't know the width yet.
    // Let's use a standard BirdNET-Pi LDFCS width-to-height ratio if possible,
    // or better, a LayoutBuilder in the parent.
    // Wait, the LDFCS width is usually very large (e.g. 5000px).
    // Let's use a simpler strategy: wrap the image in a Stack/Column and use the image's width.
    
    return Builder(builder: (context) {
       // We'll use a custom widget that measures the child (image) and sizes the header
       return _HeaderSizer(
         hourlyWeather: widget.hourlyWeather,
         child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.black,
              height: imageHeight,
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) {
                   WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentHour());
                   return Image(image: imageProvider, fit: BoxFit.fitHeight);
                },
              ),
            ),
          ),
       );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      if (widget.description != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            widget.description!,
                            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.fullscreen),
                  tooltip: "Fullscreen",
                  onPressed: () => _showFullscreen(context),
                ),
              ],
            ),
          ),
          _buildChartContent(height: 256),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

// Helper widget to size the header based on the image's width
class _HeaderSizer extends StatelessWidget {
  final List<dynamic>? hourlyWeather;
  final Widget child;

  const _HeaderSizer({required this.hourlyWeather, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            // We use a row that will take the same width as the image below it
            return IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _HeaderContent(hourlyWeather: hourlyWeather),
                  child,
                ],
              ),
            );
          }
        ),
      ],
    );
  }
}

class _HeaderContent extends StatelessWidget {
  final List<dynamic>? hourlyWeather;
  const _HeaderContent({required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    if (hourlyWeather == null || hourlyWeather!.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final cellWidth = totalWidth / 24;

        return Column(
          children: [
            // 1. Icons
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather!.length ? hourlyWeather![index] : null;
                final condition = (w?['condition'] ?? 'Clear').toString();
                final isNightClear = condition.toLowerCase() == 'clear' && w?['isday'] == 0;
                return SizedBox(
                  width: cellWidth,
                  child: Center(
                    child: Image.asset(
                      isNightClear ? 'assets/images/weather/clearmoon.png' : 'assets/images/weather/${condition.toLowerCase()}.png',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                );
              }),
            ),
            // 2. Temps
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather!.length ? hourlyWeather![index] : null;
                final temp = w?['temp'];
                Color tempColor = AppColors.primaryLight;
                if (temp != null) {
                  final t = temp as num;
                  if (t >= 30) tempColor = AppColors.error;
                  else if (t >= 15) tempColor = AppColors.warning;
                }
                return SizedBox(
                  width: cellWidth,
                  child: Text(
                    temp != null ? '${(temp as num).toStringAsFixed(0)}°' : '-',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: tempColor),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
            // 3. Wind
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather!.length ? hourlyWeather![index] : null;
                final wind = w?['wind'];
                final windDeg = w?['wind_deg'];
                final bool isStrongWind = wind != null && ((wind as num) * 1.60934) >= 16.09;
                final Color windColor = isStrongWind ? AppColors.error : AppColors.primaryLight;
                return SizedBox(
                  width: cellWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (windDeg != null)
                        Transform.rotate(
                          angle: ((windDeg as num) + 180) * 3.14159 / 180,
                          child: Icon(Icons.arrow_upward, size: 9, color: windColor),
                        ),
                      Text(
                        wind != null ? '${((wind as num) * 1.60934).toStringAsFixed(0)}' : '-',
                        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: windColor.withValues(alpha: 0.8)),
                      ),
                    ],
                  ),
                );
              }),
            ),
            // 4. Hours
            Row(
              children: List.generate(24, (index) {
                return SizedBox(
                  width: cellWidth,
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 9, color: AppColors.textHint),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
            const SizedBox(height: 4),
          ],
        );
      }
    );
  }
}
