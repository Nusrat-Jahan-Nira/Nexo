import 'package:flutter/material.dart';

import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/core/presentation/custom_view/glass_container.dart';

// Greeting + notification button row shown at the top of the job list
// screen. Extracted verbatim from job_list_screen.dart.
class JobListHeader extends StatelessWidget {
  final bool isDark;

  const JobListHeader({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, John',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Find your dream job',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
        // Notification button with glass effect
        GlassContainer(
          height: 48,
          width: 48,
          borderRadius: 12,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: isDark ? Colors.white : Colors.black87,
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: NexoColors.accentLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
