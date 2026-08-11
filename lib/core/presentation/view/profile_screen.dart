import 'package:flutter/material.dart';
import '../../util/nexo_colors.dart';
import '../custom_view/glass_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ? [const Color(0xFF1A1A2E), const Color(0xFF16213E)]
                    : [const Color(0xFFE8F3F9), const Color(0xFFD1E5F0)],
              ),
            ),
          ),

          // Header background
          Container(
            height: 240,
            decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar with border
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/32.jpg',
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        'Senior UI/UX Designer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),
                // Stats cards
                Container(
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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
                      const SizedBox(width: 12),
                      _buildStatCard(
                        count: '4',
                        label: 'Interviews',
                        icon: Icons.calendar_today_outlined,
                        color: NexoColors.accentLight,
                        isDark: isDark,
                      ),
                      const SizedBox(width: 12),
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
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // About section
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.white.withValues(alpha: 0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'I am a passionate UI/UX Designer with over 5 years of experience creating user-centered digital experiences for various platforms.',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildInfoItem(
                                    icon: Icons.location_on_outlined,
                                    text: 'San Francisco, CA',
                                    isDark: isDark,
                                  ),
                                  const SizedBox(width: 24),
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

                        const SizedBox(height: 24),

                        // Experience section
                        const Text(
                          'Experience',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.white.withValues(alpha: 0.6),
                          child: Column(
                            children: [
                              _buildExperienceItem(
                                company: 'Design Studio Inc.',
                                role: 'Senior UI/UX Designer',
                                period: '2023 - Present',
                                isDark: isDark,
                              ),
                              const Divider(),
                              _buildExperienceItem(
                                company: 'Creative Labs',
                                role: 'UI/UX Designer',
                                period: '2020 - 2023',
                                isDark: isDark,
                              ),
                              const Divider(),
                              _buildExperienceItem(
                                company: 'Tech Innovations',
                                role: 'Junior Designer',
                                period: '2018 - 2020',
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Education section
                        const Text(
                          'Education',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.white.withValues(alpha: 0.6),
                          child: Column(
                            children: [
                              _buildEducationItem(
                                institution: 'University of California',
                                degree: 'Bachelor of Design',
                                period: '2014 - 2018',
                                isDark: isDark,
                              ),
                              const Divider(),
                              _buildEducationItem(
                                institution: 'Design Academy',
                                degree: 'UX Design Certification',
                                period: '2019',
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Skills section
                        const Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        GlassContainer(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.white.withValues(alpha: 0.6),
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
                            ]
                                .map((skill) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: NexoColors.primaryLight
                                            .withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        skill,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: NexoColors.primaryLight,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Edit profile button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(
                                  color: NexoColors.primaryLight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.edit_outlined),
                            label: const Text('Edit Profile'),
                          ),
                        ),

                        const SizedBox(height: 32),
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
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
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
        const SizedBox(width: 8),
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
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: NexoColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
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
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: NexoColors.accentLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
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
