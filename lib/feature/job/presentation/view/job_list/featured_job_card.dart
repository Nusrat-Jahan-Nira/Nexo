import 'package:flutter/material.dart';

import 'package:nexo/feature/job/domain/model/job.dart';
import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/core/presentation/custom_view/glass_container.dart';
import 'package:nexo/core/presentation/view/job_detail_screen.dart';
import 'job_feature_chip.dart';

// Featured job card shown in the horizontal scroller at the top of the
// job list screen. Extracted verbatim from job_list_screen.dart.
class FeaturedJobCard extends StatelessWidget {
  final Job job;
  final bool isDark;

  const FeaturedJobCard({
    super.key,
    required this.job,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final jobMap = job.toMap();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobDetailScreen(job: jobMap),
          ),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 16),
        child: GlassContainer(
          color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.7),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              NexoColors.primaryLight.withValues(alpha: 0.1),
              NexoColors.accentLight.withValues(alpha: 0.05),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.2)
                  : Colors.grey.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Company logo
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.business, color: NexoColors.primaryLight),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.company,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: isDark ? Colors.white54 : Colors.black45,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                job.location,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark ? Colors.white54 : Colors.black45,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Bookmark button
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Job title
              Text(
                job.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              // Job details chips
              Row(
                children: [
                  JobFeatureChip(
                    text: job.type,
                    icon: Icons.work_outline,
                    isDark: isDark,
                  ),
                  const SizedBox(width: 8),
                  JobFeatureChip(
                    text: job.isRemote ? 'Remote' : 'On-site',
                    icon: job.isRemote ? Icons.wifi : Icons.location_city,
                    isDark: isDark,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Salary information
              Row(
                children: [
                  const Icon(
                    Icons.attach_money,
                    color: NexoColors.accentLight,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    job.salary,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: NexoColors.accentLight,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Apply button with gradient
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: NexoColors.primaryGradient,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: NexoColors.primaryLight.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailScreen(job: jobMap),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
