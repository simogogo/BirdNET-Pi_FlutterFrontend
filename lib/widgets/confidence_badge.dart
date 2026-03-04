import 'package:flutter/material.dart';
import '../config/theme.dart';

class ConfidenceBadge extends StatelessWidget {
  final double confidence;
  final bool compact;

  const ConfidenceBadge({
    super.key,
    required this.confidence,
    this.compact = false,
  });

  Color get _color {
    if (confidence >= 0.8) return AppColors.confidenceHigh;
    if (confidence >= 0.5) return AppColors.confidenceMedium;
    return AppColors.confidenceLow;
  }

  @override
  Widget build(BuildContext context) {
    final text = '${(confidence * 100).toStringAsFixed(0)}%';

    if (compact) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: _color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _color.withValues(alpha: 0.5)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _color,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _color.withValues(alpha: 0.3),
            _color.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.analytics_outlined, size: 14, color: _color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: _color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
