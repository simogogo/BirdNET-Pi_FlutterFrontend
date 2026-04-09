import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';
import '../config/api_config.dart';
import '../l10n/app_localizations.dart';
import '../screens/charts/report_content_view.dart';

class WeeklyLdfcsScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class WeeklyLdfcsWidget extends StatefulWidget {
  final List<dynamic> dailyTrend;
  final String type; // 'standard' or 'indices'
  final String? title; // Optional override
  final double height; // Default height
  final ReportType reportType;
  final String? cacheBuster;

  const WeeklyLdfcsWidget({
    super.key,
    required this.dailyTrend,
    required this.type,
    required this.reportType,
    this.title,
    this.height = 128,
    this.cacheBuster,
  });

  @override
  State<WeeklyLdfcsWidget> createState() => _WeeklyLdfcsWidgetState();
}

class _WeeklyLdfcsWidgetState extends State<WeeklyLdfcsWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dailyTrend.isEmpty) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final title =
        widget.title ??
        (widget.type == 'standard'
            ? (widget.reportType == ReportType.monthly
                ? l10n.monthlyLdfcsStandard
                : l10n.weeklyLdfcsStandard)
            : (widget.reportType == ReportType.monthly
                ? l10n.monthlyLdfcsIndices
                : l10n.weeklyLdfcsIndices));

    // Filter days that have the requested chart type available
    final availableDays = widget.dailyTrend.where((day) {
      final isAvailable =
          widget.type == 'standard'
              ? day['ldfcs_standard_available'] == true
              : day['ldfcs_indices_available'] == true;
      return isAvailable;
    }).toList();

    // If no days have charts, hide the entire widget
    if (availableDays.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.1),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          leading: Icon(
            Icons.image_outlined,
            color: AppColors.primaryLight.withOpacity(0.8),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${availableDays.length} images available",
            style: TextStyle(fontSize: 12, color: AppColors.textHint),
          ),
          children: [
            ScrollConfiguration(
              behavior: WeeklyLdfcsScrollBehavior(),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            availableDays
                                .map((day) => _buildDayRow(context, day))
                                .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildDayRow(BuildContext context, Map<String, dynamic> dayData) {
    final dateStr = dayData['date'] as String;
    final date = DateTime.parse(dateStr);
    final label = widget.reportType == ReportType.monthly
        ? DateFormat('d').format(date)
        : DateFormat.E(Localizations.localeOf(context).languageCode).format(date);

    final fileName =
        widget.type == 'standard'
            ? dayData['ldfcs_standard_file'] as String?
            : dayData['ldfcs_indices_file'] as String?;

    if (fileName == null) return const SizedBox.shrink();

    final imageUrl = ApiConfig.chartImage(fileName, cacheBuster: widget.cacheBuster);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryLight.withOpacity(0.7),
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.black,
              height: widget.height,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fitHeight,
                placeholder:
                    (context, url) => Container(
                      width: 500,
                      height: widget.height,
                      color: AppColors.cardElevated,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryLight,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      width: 500,
                      height: widget.height,
                      color: AppColors.cardElevated,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.broken_image,
                              color: AppColors.textHint,
                              size: 32,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dateStr,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.textHint,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
