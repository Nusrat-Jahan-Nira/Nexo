import 'package:flutter/material.dart';

// Empty-state placeholder shown when search/filters yield no jobs.
// Extracted verbatim from job_list_screen.dart.
class JobListEmptyState extends StatelessWidget {
  final bool isDark;

  const JobListEmptyState({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.work_off_outlined,
            size: 64,
            color: isDark ? Colors.white30 : Colors.black12,
          ),
          const SizedBox(height: 16),
          const Text(
            'No jobs found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search criteria',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white54 : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
