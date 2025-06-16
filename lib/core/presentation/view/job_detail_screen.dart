import 'package:flutter/material.dart';
import '../../util/nexo_colors.dart';
import '../custom_view/glass_container.dart';
import 'apply_job_screen.dart';


class JobDetailScreen extends StatelessWidget {
  final Map<String, dynamic> job;

  const JobDetailScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background design
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

          // Background shapes
          Positioned(
            top: -size.height * 0.05,
            right: -size.width * 0.25,
            child: Container(
              height: size.height * 0.25,
              width: size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.primaryLight.withOpacity(0.2),
              ),
            ),
          ),

          Positioned(
            bottom: -size.height * 0.1,
            left: -size.width * 0.15,
            child: Container(
              height: size.height * 0.3,
              width: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.accentLight.withOpacity(0.15),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // App bar with glass effect
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlassContainer(
                        height: 48,
                        width: 48,
                        borderRadius: 12,
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          color: isDark ? Colors.white : Colors.black87,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Text(
                        'Job Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GlassContainer(
                        height: 48,
                        width: 48,
                        borderRadius: 12,
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          icon: Icon(Icons.bookmark_outline),
                          color: isDark ? Colors.white : Colors.black87,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company info with glass effect
                        GlassContainer(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Company logo
                                  Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.business,
                                      color: NexoColors.primaryLight,
                                      size: 36,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          job['title'] ?? 'Job Title',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          job['company'] ?? 'Company',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              // Job highlights
                              Row(
                                children: [
                                  _buildJobHighlight(
                                    icon: Icons.work_outline,
                                    label: job['type'] ?? 'Full-time',
                                    isDark: isDark,
                                  ),
                                  _buildJobHighlight(
                                    icon: Icons.location_on_outlined,
                                    label: job['location'] ?? 'Location',
                                    isDark: isDark,
                                  ),
                                  _buildJobHighlight(
                                    icon: Icons.attach_money,
                                    label: job['salary'] ?? 'Competitive',
                                    isDark: isDark,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Job description
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Job Description',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'We are seeking a talented ${job['title']} to join our team. This is an exciting opportunity to work on cutting-edge projects in a dynamic environment.',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'This role offers competitive compensation and the chance to work with an exceptional team of professionals.',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Requirements
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Requirements',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              _buildRequirementItem(
                                'Bachelor\'s degree in Computer Science or related field',
                                isDark,
                              ),
                              _buildRequirementItem(
                                '3+ years of experience in ${job['tags']?.first ?? 'relevant'} development',
                                isDark,
                              ),
                              _buildRequirementItem(
                                'Strong problem-solving skills and attention to detail',
                                isDark,
                              ),
                              _buildRequirementItem(
                                'Excellent communication and teamwork abilities',
                                isDark,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Responsibilities
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Responsibilities',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              _buildRequirementItem(
                                'Design and implement new features and functionality',
                                isDark,
                              ),
                              _buildRequirementItem(
                                'Collaborate with cross-functional teams',
                                isDark,
                              ),
                              _buildRequirementItem(
                                'Write clean, maintainable, and efficient code',
                                isDark,
                              ),
                              _buildRequirementItem(
                                'Participate in code reviews and technical discussions',
                                isDark,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Skills
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  ...(job['tags'] as List<String>),
                                  'Communication',
                                  'Problem Solving',
                                  'Teamwork'
                                ].map((skill) => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? NexoColors.primaryLight.withOpacity(0.15)
                                        : NexoColors.primaryLight.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    skill,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: NexoColors.primaryLight,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )).toList(),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Company information
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About the Company',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                '${job['company']} is a leading company in the tech industry focused on innovation and creating exceptional products for our clients and users. We value creativity, collaboration, and a growth mindset.',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_outline,
                                    size: 16,
                                    color: isDark ? Colors.white70 : Colors.black54,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '500+ employees',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isDark ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  Icon(
                                    Icons.public,
                                    size: 16,
                                    color: isDark ? Colors.white70 : Colors.black54,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'company.com',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isDark ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 80), // Space for bottom buttons
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom apply button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GlassContainer(
              borderRadius: 0,
              padding: EdgeInsets.all(16),
              color: isDark ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.8),
              border: null,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ApplyJobScreen(job: job),
                            ),
                          );
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
                          'Apply Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobHighlight({
    required IconData icon,
    required String label,
    required bool isDark,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: isDark
                  ? NexoColors.primaryLight.withOpacity(0.1)
                  : NexoColors.primaryLight.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                icon,
                color: NexoColors.primaryLight,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: NexoColors.primaryLight,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}