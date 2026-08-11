import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nexo/feature/job/domain/model/job.dart';
import 'package:nexo/core/util/nexo_colors.dart';
import 'package:nexo/feature/job/presentation/provider/job_provider.dart';
import 'job_list/featured_job_card.dart';
import 'job_list/job_card.dart';
import 'job_list/job_filter_sheet.dart';
import 'job_list/job_filter_state.dart';
import 'job_list/job_list_empty_state.dart';
import 'job_list/job_list_header.dart';
import 'job_list/job_search_bar.dart';

class JobListScreen extends ConsumerStatefulWidget {
  const JobListScreen({super.key});

  @override
  ConsumerState<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends ConsumerState<JobListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  JobFilterState _filter = JobFilterState.initial;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _searchJobs(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _showFilterDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showJobFilterSheet(
      context: context,
      isDark: isDark,
      initialFilter: _filter,
      onApply: (updated) {
        setState(() {
          _filter = updated;
        });
      },
    );
  }

  // Applies the live search query and active filters to the raw job list.
  List<Job> _applySearchAndFilters(List<Job> jobs) {
    final query = _searchQuery.trim().toLowerCase();

    return jobs.where((job) {
      if (query.isNotEmpty) {
        final matchesQuery = job.title.toLowerCase().contains(query) ||
            job.company.toLowerCase().contains(query) ||
            job.tags.any((tag) => tag.toLowerCase().contains(query));
        if (!matchesQuery) return false;
      }

      if (_filter.selectedJobTypes.isNotEmpty &&
          !_filter.selectedJobTypes.contains(job.type)) {
        return false;
      }

      if (_filter.remoteOnly && !job.isRemote) {
        return false;
      }

      final salary = _extractMinSalary(job.salary);
      if (salary != null &&
          (salary < _filter.salaryRange.start ||
              salary > _filter.salaryRange.end)) {
        return false;
      }

      return true;
    }).toList();
  }

  // Best-effort parse of the leading number out of strings like
  // "$120K - $140K" so the salary range filter has something to compare against.
  double? _extractMinSalary(String salary) {
    final match = RegExp(r'(\d+(?:\.\d+)?)K').firstMatch(salary);
    if (match == null) return null;
    final value = double.tryParse(match.group(1)!);
    return value == null ? null : value * 1000;
  }

  List<Job> _jobsForCategory(String category, List<Job> jobs) {
    if (category == 'recent') {
      return jobs
          .where((job) =>
              job.datePosted == '1d ago' ||
              job.datePosted == '2d ago' ||
              job.datePosted == '3d ago')
          .toList();
    } else if (category == 'applied') {
      return jobs.take(2).toList();
    }
    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final jobsAsync = ref.watch(jobListProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background design with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [const Color(0xFF1A1A2E), const Color(0xFF16213E)]
                    : [const Color(0xFFE8F3F9), const Color(0xFFD1E5F0)],
              ),
            ),
          ),

          // Background decorative circles
          Positioned(
            top: -size.height * 0.10,
            left: -size.width * 0.25,
            child: Container(
              height: size.height * 0.3,
              width: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    NexoColors.primaryLight.withValues(alpha: 0.2),
                    NexoColors.accentLight.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: size.height * 0.1,
            right: -size.width * 0.3,
            child: Container(
              height: size.height * 0.4,
              width: size.height * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    NexoColors.accentLight.withValues(alpha: 0.1),
                    NexoColors.primaryLight.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),
          ),

          // Main content using nested scroll view for header that collapses
          SafeArea(
            child: jobsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
                child: Text(
                  'Failed to load jobs: $err',
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87),
                ),
              ),
              data: (jobs) {
                final visibleJobs = _applySearchAndFilters(jobs);
                final featuredJobs =
                    visibleJobs.where((job) => job.isFeatured).toList();

                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header with greeting and notifications
                              JobListHeader(isDark: isDark),

                              const SizedBox(height: 24),

                              // Search bar with glass effect
                              JobSearchBar(
                                controller: _searchController,
                                isDark: isDark,
                                onChanged: _searchJobs,
                                onFilterTap: _showFilterDialog,
                              ),

                              const SizedBox(height: 24),

                              // Featured Jobs section
                              const Text(
                                'Featured Jobs',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Featured jobs horizontal scrollable list
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: featuredJobs.length,
                                  itemBuilder: (context, index) {
                                    return FeaturedJobCard(
                                        job: featuredJobs[index],
                                        isDark: isDark);
                                  },
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Tab bar with animated selection indicator
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      isDark ? Colors.black26 : Colors.white30,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  labelColor:
                                      isDark ? Colors.white : Colors.black,
                                  unselectedLabelColor:
                                      isDark ? Colors.white54 : Colors.black45,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                      colors: NexoColors.primaryGradient,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: NexoColors.primaryLight
                                            .withValues(alpha: 0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  tabs: const [
                                    Tab(text: 'All Jobs'),
                                    Tab(text: 'Recent'),
                                    Tab(text: 'Applied'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  // Tab content
                  body: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildJobList(
                          _jobsForCategory('all', visibleJobs), isDark),
                      _buildJobList(
                          _jobsForCategory('recent', visibleJobs), isDark),
                      _buildJobList(
                          _jobsForCategory('applied', visibleJobs), isDark),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Floating Action Button with gradient and glass effect
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: NexoColors.primaryGradient,
          ),
          boxShadow: [
            BoxShadow(
              color: NexoColors.primaryLight.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _showFilterDialog,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Regular job list for a tab.
  Widget _buildJobList(List<Job> filteredJobs, bool isDark) {
    if (filteredJobs.isEmpty) {
      return JobListEmptyState(isDark: isDark);
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: filteredJobs.length,
      itemBuilder: (context, index) {
        return JobCard(job: filteredJobs[index], isDark: isDark);
      },
    );
  }
}
