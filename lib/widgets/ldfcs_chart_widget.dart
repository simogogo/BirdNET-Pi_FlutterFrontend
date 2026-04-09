import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';
import '../l10n/app_localizations.dart';

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
  final String? cacheBuster;

  const LdfcsChartWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    this.description,
    this.hourlyWeather,
    this.cacheBuster,
  });

  @override
  State<LdfcsChartWidget> createState() => _LdfcsChartWidgetState();
}

class _LdfcsChartWidgetState extends State<LdfcsChartWidget> {
  @override
  Widget build(BuildContext context) {
    // In full-screen dialog, we show it at 512px height. 
    // We can detect if we are in dialog by context or just use a flag.
    // For simplicity, let's keep it 256 for home and 512 for popup.
    // We'll use a local helper to build the content.
    return _buildCard(context, height: 256);
  }

  Widget _buildCard(BuildContext context, {required double height}) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (widget.description != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                widget.description!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.fullscreen),
                      tooltip: l10n.fullscreenTooltip,
                      onPressed: () {
                        showDialog(
                          context: context,
                          useRootNavigator: false,
                          builder: (context) => Dialog.fullscreen(
                            backgroundColor: AppColors.surface,
                            child: Scaffold(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: LdfcsChartWidgetInternal(
                                    imageUrl: widget.imageUrl,
                                    hourlyWeather: widget.hourlyWeather,
                                    height: 512,
                                    cacheBuster: widget.cacheBuster,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          LdfcsChartWidgetInternal(
            imageUrl: widget.imageUrl,
            hourlyWeather: widget.hourlyWeather,
            height: 256,
            cacheBuster: widget.cacheBuster,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

// Internal widget to handle the scrollable content with precise sizing
class LdfcsChartWidgetInternal extends StatefulWidget {
  final String imageUrl;
  final List<dynamic>? hourlyWeather;
  final double height;
  final String? cacheBuster;

  const LdfcsChartWidgetInternal({
    super.key,
    required this.imageUrl,
    this.hourlyWeather,
    required this.height,
    this.cacheBuster,
  });

  @override
  State<LdfcsChartWidgetInternal> createState() => _LdfcsChartWidgetInternalState();
}

class _LdfcsChartWidgetInternalState extends State<LdfcsChartWidgetInternal> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolled = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeScroll() {
    if (_hasScrolled || !mounted || !_scrollController.hasClients) return;
    
    final maxScroll = _scrollController.position.maxScrollExtent;
    final viewportWidth = _scrollController.position.viewportDimension;
    final totalWidth = maxScroll + viewportWidth - 32;

    if (totalWidth <= 0) return;

    final now = DateTime.now();
    final hour = now.hour + (now.minute / 60.0);
    final hourWidth = totalWidth / 24;
    final targetOffset = (hourWidth * hour) - (viewportWidth / 2);

    _scrollController.animateTo(
      targetOffset.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 8 * (100)), // 800ms
      curve: Curves.easeInOut,
    );
    _hasScrolled = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: widget.height + (widget.hourlyWeather != null ? 80 : 20),
      child: ScrollConfiguration(
        behavior: LdfcsScrollBehavior(),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: widget.cacheBuster != null
                    ? (widget.imageUrl.contains('?')
                        ? '${widget.imageUrl}&t=${widget.cacheBuster}'
                        : '${widget.imageUrl}?t=${widget.cacheBuster}')
                    : widget.imageUrl,
                imageBuilder: (context, imageProvider) {
                  // Ensure scroll happens after image renders
                  WidgetsBinding.instance.addPostFrameCallback((_) => _maybeScroll());

                  return IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (widget.hourlyWeather != null)
                          _WeatherHeader(hourlyWeather: widget.hourlyWeather!),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: Colors.black,
                            height: widget.height,
                            child: Image(image: imageProvider, fit: BoxFit.fitHeight),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                placeholder: (context, url) => Container(
                  width: MediaQuery.of(context).size.width - 64,
                  height: widget.height,
                  color: AppColors.cardElevated,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLight,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: MediaQuery.of(context).size.width - 64,
                  height: widget.height,
                  color: AppColors.cardElevated,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 48, color: AppColors.textHint),
                      const SizedBox(height: 12),
                      Text(l10n.chartDataNotAvailable),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherHeader extends StatelessWidget {
  final List<dynamic> hourlyWeather;
  const _WeatherHeader({required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cellWidth = constraints.maxWidth / 24;
        if (cellWidth <= 0) return const SizedBox.shrink();

        return Column(
          children: [
            // Icons
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather.length ? hourlyWeather[index] : null;
                final condition = (w?['condition'] ?? 'Clear').toString();
                final isNightClear = condition.toLowerCase() == 'clear' && w?['isday'] == 0;
                return SizedBox(
                  width: cellWidth,
                  child: Center(
                    child: Image.asset(
                      isNightClear ? 'assets/images/weather/clearmoon.png' : 'assets/images/weather/${condition.toLowerCase()}.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                );
              }),
            ),
            // Temps
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather.length ? hourlyWeather[index] : null;
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
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: tempColor),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
            // Wind
            Row(
              children: List.generate(24, (index) {
                final w = index < hourlyWeather.length ? hourlyWeather[index] : null;
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
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: windColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            // Hours
            Row(
              children: List.generate(24, (index) {
                return SizedBox(
                  width: cellWidth,
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 10, color: AppColors.textHint),
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
