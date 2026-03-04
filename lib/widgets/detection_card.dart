import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';
import '../models/detection.dart';
import '../services/api_service.dart';
import 'confidence_badge.dart';

class DetectionCard extends StatelessWidget {
  final Detection detection;
  final ApiService apiService;
  final VoidCallback? onTap;
  final bool showImage;

  const DetectionCard({
    super.key,
    required this.detection,
    required this.apiService,
    this.onTap,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final spectrogramUrl = apiService.getSpectrogramImageUrl(
      detection.extractedPath,
    );

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              if (showImage) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: spectrogramUrl,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.cardElevated,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.music_note,
                        color: AppColors.textHint,
                      ),
                    ),
                    errorWidget: (_, _, _) => Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.cardElevated,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.broken_image,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detection.commonName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      detection.scientificName,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 13,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          detection.time.length >= 5
                              ? detection.time.substring(0, 5)
                              : detection.time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ConfidenceBadge(confidence: detection.confidence),
            ],
          ),
        ),
      ),
    );
  }
}
