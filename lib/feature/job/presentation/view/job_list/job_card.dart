import 'package:flutter/material.dart';

import 'package:nexo/feature/job/domain/model/job.dart';
import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/core/presentation/custom_view/glass_container.dart';
import 'package:nexo/core/presentation/view/job_detail_screen.dart';
import 'job_feature_chip.dart';

// Regular job card used in the "All Jobs" / "Recent" / "Applied" lists.
// Extracted verbatim from job_list_screen.dart.
class JobCard extends StatelessWidget {
  final Job job;
  final bool isDark;

  const JobCard({
    super.key,
    required this.job,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobDetailScreen(job: job.toMap()),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: GlassContainer(
          color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white.withValues(alpha: 0.6),
          padding: const EdgeInsets.all(16),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.business, color: NexoColors.primaryLight),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              job.company,
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: NexoColors.primaryLight.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                job.datePosted,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: NexoColors.primaryLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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

              // Job details
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: isDark ? Colors.white54 : Colors.black45,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            job.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.black45,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 16,
                          color: isDark ? Colors.white54 : Colors.black45,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            job.salary,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.black45,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Tags
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: job.tags.map((tag) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isDark
                            ? NexoColors.primaryLight.withValues(alpha: 0.15)
                            : NexoColors.primaryLight.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          color: NexoColors.primaryLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                ).toList(),
              ),

              // Type and remote status
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JobFeatureChip(
                      text: job.type,
                      icon: Icons.work_outline,
                      isDark: isDark,
                    ),
                    if (job.isRemote)
                      JobFeatureChip(
                        text: 'Remote',
                        icon: Icons.wifi,
                        isDark: isDark,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
