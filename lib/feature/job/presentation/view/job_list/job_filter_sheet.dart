import 'package:flutter/material.dart';

import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/core/presentation/custom_view/glass_container.dart';
import 'job_filter_state.dart';

// Job type options
const List<String> kJobTypeOptions = ['Full-time', 'Part-time', 'Contract', 'Freelance', 'Internship'];

// Experience level options
const List<String> kExperienceLevelOptions = ['Entry Level', 'Mid Level', 'Senior Level', 'Manager', 'Executive'];

// Filter bottom sheet. Extracted verbatim (visually) from
// job_list_screen.dart's _showFilterDialog. The applied filters are handed
// back to the caller via [onApply] so job_list_screen.dart can actually
// filter the displayed jobs (previously this only printed to the console).
Future<void> showJobFilterSheet({
  required BuildContext context,
  required bool isDark,
  required JobFilterState initialFilter,
  required ValueChanged<JobFilterState> onApply,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      JobFilterState draft = initialFilter;
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (_, scrollController) {
              return GlassContainer(
                borderRadius: 24,
                color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Filter Jobs',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),

                    // Filter options
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        children: [
                          // Job Type section
                          const Text(
                            'Job Type',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: kJobTypeOptions.map((type) => FilterChip(
                              label: Text(type),
                              selected: draft.selectedJobTypes.contains(type),
                              onSelected: (selected) {
                                setState(() {
                                  final updated = List<String>.from(draft.selectedJobTypes);
                                  if (selected) {
                                    updated.add(type);
                                  } else {
                                    updated.remove(type);
                                  }
                                  draft = draft.copyWith(selectedJobTypes: updated);
                                });
                              },
                              selectedColor: NexoColors.primaryLight.withValues(alpha: 0.2),
                              checkmarkColor: NexoColors.primaryLight,
                            )).toList(),
                          ),

                          const SizedBox(height: 24),

                          // Experience Level section
                          const Text(
                            'Experience Level',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: kExperienceLevelOptions.map((level) => FilterChip(
                              label: Text(level),
                              selected: draft.selectedExperienceLevels.contains(level),
                              onSelected: (selected) {
                                setState(() {
                                  final updated = List<String>.from(draft.selectedExperienceLevels);
                                  if (selected) {
                                    updated.add(level);
                                  } else {
                                    updated.remove(level);
                                  }
                                  draft = draft.copyWith(selectedExperienceLevels: updated);
                                });
                              },
                              selectedColor: NexoColors.primaryLight.withValues(alpha: 0.2),
                              checkmarkColor: NexoColors.primaryLight,
                            )).toList(),
                          ),

                          const SizedBox(height: 24),

                          // Salary Range section
                          const Text(
                            'Salary Range',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${draft.salaryRange.start.toInt() / 1000}K',
                                style: TextStyle(
                                  color: isDark ? Colors.white70 : Colors.black54,
                                ),
                              ),
                              Text(
                                '\$${draft.salaryRange.end.toInt() / 1000}K',
                                style: TextStyle(
                                  color: isDark ? Colors.white70 : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          RangeSlider(
                            values: draft.salaryRange,
                            min: 0,
                            max: 200000,
                            divisions: 20,
                            activeColor: NexoColors.primaryLight,
                            inactiveColor: isDark ? Colors.white30 : Colors.black12,
                            labels: RangeLabels(
                              '\$${draft.salaryRange.start.toInt() / 1000}K',
                              '\$${draft.salaryRange.end.toInt() / 1000}K',
                            ),
                            onChanged: (values) {
                              setState(() {
                                draft = draft.copyWith(salaryRange: values);
                              });
                            },
                          ),

                          const SizedBox(height: 24),

                          // Location section
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter city or region',
                              prefixIcon: const Icon(Icons.location_on_outlined),
                              fillColor: isDark
                                  ? Colors.white.withValues(alpha: 0.05)
                                  : Colors.black.withValues(alpha: 0.03),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Remote Only toggle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Remote Only',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Switch(
                                value: draft.remoteOnly,
                                onChanged: (value) {
                                  setState(() {
                                    draft = draft.copyWith(remoteOnly: value);
                                  });
                                },
                                activeThumbColor: NexoColors.primaryLight,
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Only show jobs that can be done remotely',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Action buttons
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Reset button
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  draft = JobFilterState.initial;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                side: const BorderSide(color: NexoColors.primaryLight),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Reset'),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Apply button with gradient
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                  colors: NexoColors.primaryGradient,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  onApply(draft);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
