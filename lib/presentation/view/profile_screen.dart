import 'package:flutter/material.dart';
import '../../core/nexo_colors.dart';
import '../custom_view/glass_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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

          // Header background
          Container(
            height: 240,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  NexoColors.primaryLight,
                  NexoColors.accentLight,
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Profile header
                Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar with border
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/32.jpg',
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Senior UI/UX Designer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),

                SizedBox(height: 30.0,),
                // Stats cards
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Row(
                    children: [
                      _buildStatCard(
                        count: '10',
                        label: 'Applications',
                        icon: Icons.send_outlined,
                        color: NexoColors.primaryLight,
                        isDark: isDark,
                      ),
                      SizedBox(width: 12),
                      _buildStatCard(
                        count: '4',
                        label: 'Interviews',
                        icon: Icons.calendar_today_outlined,
                        color: NexoColors.accentLight,
                        isDark: isDark,
                      ),
                      SizedBox(width: 12),
                      _buildStatCard(
                        count: '15',
                        label: 'Saved Jobs',
                        icon: Icons.bookmark_outline,
                        color: Colors.indigo,
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),

                // Content sections
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // About section
                        Text(
                          'About',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.white.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'I am a passionate UI/UX Designer with over 5 years of experience creating user-centered digital experiences for various platforms.',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),

                              SizedBox(height: 16),

                              Row(
                                children: [
                                  _buildInfoItem(
                                    icon: Icons.location_on_outlined,
                                    text: 'San Francisco, CA',
                                    isDark: isDark,
                                  ),
                                  SizedBox(width: 24),
                                  _buildInfoItem(
                                    icon: Icons.language_outlined,
                                    text: 'johndoe.design',
                                    isDark: isDark,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Experience section
                        Text(
                          'Experience',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.white.withOpacity(0.6),
                          child: Column(
                            children: [
                              _buildExperienceItem(
                                company: 'Design Studio Inc.',
                                role: 'Senior UI/UX Designer',
                                period: '2023 - Present',
                                isDark: isDark,
                              ),

                              Divider(),

                              _buildExperienceItem(
                                company: 'Creative Labs',
                                role: 'UI/UX Designer',
                                period: '2020 - 2023',
                                isDark: isDark,
                              ),

                              Divider(),

                              _buildExperienceItem(
                                company: 'Tech Innovations',
                                role: 'Junior Designer',
                                period: '2018 - 2020',
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Education section
                        Text(
                          'Education',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.white.withOpacity(0.6),
                          child: Column(
                            children: [
                              _buildEducationItem(
                                institution: 'University of California',
                                degree: 'Bachelor of Design',
                                period: '2014 - 2018',
                                isDark: isDark,
                              ),

                              Divider(),

                              _buildEducationItem(
                                institution: 'Design Academy',
                                degree: 'UX Design Certification',
                                period: '2019',
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Skills section
                        Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.white.withOpacity(0.6),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              'UI Design',
                              'UX Design',
                              'Figma',
                              'Adobe XD',
                              'Sketch',
                              'Prototyping',
                              'User Research',
                              'Wireframing',
                              'Interaction Design',
                              'Visual Design',
                            ].map((skill) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: NexoColors.primaryLight.withOpacity(0.1),
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
                        ),

                        SizedBox(height: 32),

                        // Edit profile button
                        Container(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: NexoColors.primaryLight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: Icon(Icons.edit_outlined),
                            label: Text('Edit Profile'),
                          ),
                        ),

                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String count,
    required String label,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Expanded(
      child: GlassContainer(
        color: isDark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String text,
    required bool isDark,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceItem({
    required String company,
    required String role,
    required String period,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: NexoColors.primaryLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.business_center_outlined,
              color: NexoColors.primaryLight,
              size: 20,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white54 : Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem({
    required String institution,
    required String degree,
    required String period,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: NexoColors.accentLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.school_outlined,
              color: NexoColors.accentLight,
              size: 20,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  institution,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  period,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white54 : Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}