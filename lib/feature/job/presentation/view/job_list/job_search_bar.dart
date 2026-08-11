import 'package:flutter/material.dart';

import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/core/presentation/custom_view/glass_container.dart';

// Search field + filter button shown under the header. Extracted verbatim
// from job_list_screen.dart. Search now filters live via onChanged instead
// of only firing on submit.
class JobSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isDark;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  const JobSearchBar({
    super.key,
    required this.controller,
    required this.isDark,
    required this.onChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Search jobs...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onChanged: onChanged,
            ),
          ),
          // Filter button with gradient
          const SizedBox(width: 8.0),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: NexoColors.primaryGradient,
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.tune, color: Colors.white, size: 20),
              onPressed: onFilterTap,
            ),
          ),
        ],
      ),
    );
  }
}
