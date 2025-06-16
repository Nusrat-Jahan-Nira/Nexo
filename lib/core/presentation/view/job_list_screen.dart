import 'package:flutter/material.dart';
import '../../util/nexo_colors.dart';
import '../custom_view/glass_container.dart';
import 'job_detail_screen.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  // Sample job data
  final List<Map<String, dynamic>> _jobs = [
    {
      'title': 'Senior UI/UX Designer',
      'company': 'Dribbble Inc.',
      'logo': 'assets/logos/dribbble.png',
      'location': 'San Francisco, CA',
      'salary': '\$120K - \$140K',
      'type': 'Full-time',
      'tags': ['UI/UX', 'Figma', 'Adobe XD'],
      'isRemote': true,
      'isFeatured': true,
      'datePosted': '2d ago',
    },
    {
      'title': 'Flutter Developer',
      'company': 'Google',
      'logo': 'assets/logos/google.png',
      'location': 'Mountain View, CA',
      'salary': '\$110K - \$130K',
      'type': 'Full-time',
      'tags': ['Flutter', 'Dart', 'Mobile'],
      'isRemote': false,
      'isFeatured': true,
      'datePosted': '3d ago',
    },
    {
      'title': 'Product Manager',
      'company': 'Spotify',
      'logo': 'assets/logos/spotify.png',
      'location': 'New York, NY',
      'salary': '\$130K - \$150K',
      'type': 'Full-time',
      'tags': ['Product', 'Strategy', 'Agile'],
      'isRemote': true,
      'isFeatured': false,
      'datePosted': '1w ago',
    },
    {
      'title': 'DevOps Engineer',
      'company': 'Amazon',
      'logo': 'assets/logos/amazon.png',
      'location': 'Seattle, WA',
      'salary': '\$125K - \$145K',
      'type': 'Full-time',
      'tags': ['AWS', 'Docker', 'Kubernetes'],
      'isRemote': false,
      'isFeatured': false,
      'datePosted': '5d ago',
    },
    {
      'title': 'Frontend Developer',
      'company': 'Meta',
      'logo': 'assets/logos/meta.png',
      'location': 'Menlo Park, CA',
      'salary': '\$115K - \$135K',
      'type': 'Contract',
      'tags': ['React', 'JavaScript', 'CSS'],
      'isRemote': true,
      'isFeatured': false,
      'datePosted': '1d ago',
    },
    {
      'title': 'Data Scientist',
      'company': 'Netflix',
      'logo': 'assets/logos/netflix.png',
      'location': 'Los Angeles, CA',
      'salary': '\$130K - \$160K',
      'type': 'Full-time',
      'tags': ['Python', 'ML', 'Data Analysis'],
      'isRemote': true,
      'isFeatured': true,
      'datePosted': '2d ago',
    },
    {
      'title': 'iOS Developer',
      'company': 'Apple',
      'logo': 'assets/logos/apple.png',
      'location': 'Cupertino, CA',
      'salary': '\$120K - \$150K',
      'type': 'Full-time',
      'tags': ['Swift', 'iOS', 'Mobile'],
      'isRemote': false,
      'isFeatured': false,
      'datePosted': '4d ago',
    },
    {
      'title': 'Backend Engineer',
      'company': 'Microsoft',
      'logo': 'assets/logos/microsoft.png',
      'location': 'Redmond, WA',
      'salary': '\$125K - \$145K',
      'type': 'Full-time',
      'tags': ['Java', 'Spring', 'Microservices'],
      'isRemote': true,
      'isFeatured': false,
      'datePosted': '1w ago',
    },
  ];

  // Selected filters
  List<String> _selectedJobTypes = [];
  List<String> _selectedExperienceLevels = [];
  RangeValues _salaryRange = RangeValues(40000, 160000);
  bool _remoteOnly = false;

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
    // Implementation for job search would go here
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                    ? [Color(0xFF1A1A2E), Color(0xFF16213E)]
                    : [Color(0xFFE8F3F9), Color(0xFFD1E5F0)],
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
                    NexoColors.primaryLight.withOpacity(0.2),
                    NexoColors.accentLight.withOpacity(0.1),
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
                    NexoColors.accentLight.withOpacity(0.1),
                    NexoColors.primaryLight.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),

          // Main content using nested scroll view for header that collapses
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with greeting and notifications
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello, John',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
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
                                      icon: Icon(Icons.notifications_outlined),
                                      color: isDark ? Colors.white : Colors.black87,
                                      onPressed: () {},
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          color: NexoColors.accentLight,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24),

                          // Search bar with glass effect
                          GlassContainer(
                            color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
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
                                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    onSubmitted: _searchJobs,
                                  ),
                                ),
                                // Filter button with gradient
                                SizedBox(width: 8.0,),
                                Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: NexoColors.primaryGradient,
                                    ),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.tune, color: Colors.white, size: 20),
                                    onPressed: () {
                                      _showFilterDialog();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 24),

                          // Featured Jobs section
                          Text(
                            'Featured Jobs',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 16),

                          // Featured jobs horizontal scrollable list
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: _jobs.where((job) => job['isFeatured'] == true).length,
                              itemBuilder: (context, index) {
                                final featuredJobs = _jobs.where((job) => job['isFeatured'] == true).toList();
                                final job = featuredJobs[index];
                                return _buildFeaturedJobCard(job, isDark);
                              },
                            ),
                          ),

                          SizedBox(height: 24),

                          // Tab bar with animated selection indicator
                          Container(
                            decoration: BoxDecoration(
                              color: isDark ? Colors.black26 : Colors.white30,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              labelColor: isDark ? Colors.white : Colors.black,
                              unselectedLabelColor: isDark ? Colors.white54 : Colors.black45,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  colors: NexoColors.primaryGradient,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: NexoColors.primaryLight.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
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
                  _buildJobList('all'),
                  _buildJobList('recent'),
                  _buildJobList('applied'),
                ],
              ),
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
          gradient: LinearGradient(
            colors: NexoColors.primaryGradient,
          ),
          boxShadow: [
            BoxShadow(
              color: NexoColors.primaryLight.withOpacity(0.4),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _showFilterDialog,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Featured job card with glass effect
  Widget _buildFeaturedJobCard(Map<String, dynamic> job, bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobDetailScreen(job: job),
          ),
        );
      },
      child: Container(
        width: 280,
        margin: EdgeInsets.only(right: 16),
        child: GlassContainer(
          color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.7),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              NexoColors.primaryLight.withOpacity(0.1),
              NexoColors.accentLight.withOpacity(0.05),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 12,
              offset: Offset(0, 6),
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.business, color: NexoColors.primaryLight),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job['company'] ?? 'Company',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: isDark ? Colors.white54 : Colors.black45,
                            ),
                            SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                job['location'] ?? 'Location',
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

              SizedBox(height: 16),

              // Job title
              Text(
                job['title'] ?? 'Job Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 12),

              // Job details chips
              Row(
                children: [
                  _buildJobFeatureChip(
                    text: job['type'] ?? 'Type',
                    icon: Icons.work_outline,
                    isDark: isDark,
                  ),
                  SizedBox(width: 8),
                  _buildJobFeatureChip(
                  text: job['isRemote'] ? 'Remote' : 'On-site',
                  icon: job['isRemote'] ? Icons.wifi : Icons.location_city,
                  isDark: isDark,
                ),
                ],
              ),

              SizedBox(height: 12),

              // Salary information
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: NexoColors.accentLight,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    job['salary'] ?? 'Competitive',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: NexoColors.accentLight,
                    ),
                  ),
                ],
              ),

              Spacer(),

              // Apply button with gradient
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: NexoColors.primaryGradient,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: NexoColors.primaryLight.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailScreen(job: job),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
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

  // Regular job list
  Widget _buildJobList(String category) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Filter jobs based on category
    List<Map<String, dynamic>> filteredJobs;

    if (category == 'recent') {
      // For demo, we'll consider jobs posted within the last 3 days as recent
      filteredJobs = _jobs.where((job) =>
      job['datePosted'] == '1d ago' || job['datePosted'] == '2d ago' || job['datePosted'] == '3d ago'
      ).toList();
    } else if (category == 'applied') {
      // For demo, let's assume some jobs are already applied for
      filteredJobs = _jobs.take(2).toList();
    } else {
      // All jobs
      filteredJobs = _jobs;
    }

    if (filteredJobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_off_outlined,
              size: 64,
              color: isDark ? Colors.white30 : Colors.black12,
            ),
            SizedBox(height: 16),
            Text(
              'No jobs found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
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

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: filteredJobs.length,
      itemBuilder: (context, index) {
        final job = filteredJobs[index];
        return _buildJobCard(job, isDark);
      },
    );
  }

  // Regular job card with glass effect
  Widget _buildJobCard(Map<String, dynamic> job, bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => JobDetailScreen(job: job),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: GlassContainer(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.6),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Company logo
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(Icons.business, color: NexoColors.primaryLight),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job['title'] ?? 'Job Title',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              job['company'] ?? 'Company',
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: NexoColors.primaryLight.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                job['datePosted'] ?? '',
                                style: TextStyle(
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

              SizedBox(height: 16),

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
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            job['location'] ?? 'Location',
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
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            job['salary'] ?? 'Competitive',
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

              SizedBox(height: 16),

              // Tags
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (job['tags'] as List<String>).map((tag) =>
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isDark
                            ? NexoColors.primaryLight.withOpacity(0.15)
                            : NexoColors.primaryLight.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
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
                    _buildJobFeatureChip(
                      text: job['type'] ?? 'Type',
                      icon: Icons.work_outline,
                      isDark: isDark,
                    ),
                    if (job['isRemote'])
                      _buildJobFeatureChip(
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

  // Feature chip used in job cards
  Widget _buildJobFeatureChip({
    required String text,
    required IconData icon,
    required bool isDark,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isDark ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Filter dialog with glass effect
  void _showFilterDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Job type options
    final jobTypes = ['Full-time', 'Part-time', 'Contract', 'Freelance', 'Internship'];

    // Experience level options
    final experienceLevels = ['Entry Level', 'Mid Level', 'Senior Level', 'Manager', 'Executive'];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
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
                            Text(
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

                      Divider(),

                      // Filter options
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          children: [
                            // Job Type section
                            Text(
                              'Job Type',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: jobTypes.map((type) => FilterChip(
                                label: Text(type),
                                selected: _selectedJobTypes.contains(type),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedJobTypes.add(type);
                                    } else {
                                      _selectedJobTypes.remove(type);
                                    }
                                  });
                                },
                                selectedColor: NexoColors.primaryLight.withOpacity(0.2),
                                checkmarkColor: NexoColors.primaryLight,
                              )).toList(),
                            ),

                            SizedBox(height: 24),

                            // Experience Level section
                            Text(
                              'Experience Level',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: experienceLevels.map((level) => FilterChip(
                                label: Text(level),
                                selected: _selectedExperienceLevels.contains(level),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedExperienceLevels.add(level);
                                    } else {
                                      _selectedExperienceLevels.remove(level);
                                    }
                                  });
                                },
                                selectedColor: NexoColors.primaryLight.withOpacity(0.2),
                                checkmarkColor: NexoColors.primaryLight,
                              )).toList(),
                            ),

                            SizedBox(height: 24),

                            // Salary Range section
                            Text(
                              'Salary Range',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${_salaryRange.start.toInt() / 1000}K',
                                  style: TextStyle(
                                    color: isDark ? Colors.white70 : Colors.black54,
                                  ),
                                ),
                                Text(
                                  '\$${_salaryRange.end.toInt() / 1000}K',
                                  style: TextStyle(
                                    color: isDark ? Colors.white70 : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            RangeSlider(
                              values: _salaryRange,
                              min: 0,
                              max: 200000,
                              divisions: 20,
                              activeColor: NexoColors.primaryLight,
                              inactiveColor: isDark ? Colors.white30 : Colors.black12,
                              labels: RangeLabels(
                                '\$${_salaryRange.start.toInt() / 1000}K',
                                '\$${_salaryRange.end.toInt() / 1000}K',
                              ),
                              onChanged: (values) {
                                setState(() {
                                  _salaryRange = values;
                                });
                              },
                            ),

                            SizedBox(height: 24),

                            // Location section
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter city or region',
                                prefixIcon: Icon(Icons.location_on_outlined),
                                fillColor: isDark
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.black.withOpacity(0.03),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            SizedBox(height: 24),

                            // Remote Only toggle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Remote Only',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Switch(
                                  value: _remoteOnly,
                                  onChanged: (value) {
                                    setState(() {
                                      _remoteOnly = value;
                                    });
                                  },
                                  activeColor: NexoColors.primaryLight,
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

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
                                    _selectedJobTypes = [];
                                    _selectedExperienceLevels = [];
                                    _salaryRange = RangeValues(40000, 160000);
                                    _remoteOnly = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  side: BorderSide(color: NexoColors.primaryLight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('Reset'),
                              ),
                            ),

                            SizedBox(width: 16),

                            // Apply button with gradient
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    colors: NexoColors.primaryGradient,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Apply filters and close dialog
                                    Navigator.pop(context);

                                    // Here you would update the job list based on filters
                                    // For this UI demo, we'll just print the selected filters
                                    print('Applied filters:');
                                    print('Job Types: $_selectedJobTypes');
                                    print('Experience Levels: $_selectedExperienceLevels');
                                    print('Salary Range: $_salaryRange');
                                    print('Remote Only: $_remoteOnly');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
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
}