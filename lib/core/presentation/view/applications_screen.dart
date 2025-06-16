import 'package:flutter/material.dart';
import '../../util/nexo_colors.dart';
import '../custom_view/glass_container.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Sample applications data
    final applications = [
      {
        'jobTitle': 'Senior UI/UX Designer',
        'company': 'Dribbble Inc.',
        'date': 'June 10, 2025',
        'status': 'Under Review',
        'statusColor': Colors.amber,
      },
      {
        'jobTitle': 'Flutter Developer',
        'company': 'Google',
        'date': 'June 8, 2025',
        'status': 'Interview Scheduled',
        'statusColor': NexoColors.primaryLight,
      },
      {
        'jobTitle': 'Product Manager',
        'company': 'Spotify',
        'date': 'June 5, 2025',
        'status': 'Rejected',
        'statusColor': NexoColors.errorLight,
      },
      {
        'jobTitle': 'Frontend Developer',
        'company': 'Meta',
        'date': 'May 30, 2025',
        'status': 'Accepted',
        'statusColor': NexoColors.successLight,
      },
      {
        'jobTitle': 'DevOps Engineer',
        'company': 'Amazon',
        'date': 'May 25, 2025',
        'status': 'Under Review',
        'statusColor': Colors.amber,
      },
    ];

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
            top: -size.height * 0.15,
            right: -size.width * 0.2,
            child: Container(
              height: size.height * 0.35,
              width: size.height * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.primaryLight.withOpacity(0.2),
              ),
            ),
          ),

          Positioned(
            bottom: -size.height * 0.05,
            left: -size.width * 0.15,
            child: Container(
              height: size.height * 0.25,
              width: size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.accentLight.withOpacity(0.15),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'My Applications',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Statistics cards
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildStatCard(
                        count: '5',
                        label: 'Applied',
                        color: NexoColors.primaryLight,
                        isDark: isDark,
                      ),
                      SizedBox(width: 16),
                      _buildStatCard(
                        count: '2',
                        label: 'In Review',
                        color: Colors.amber,
                        isDark: isDark,
                      ),
                      SizedBox(width: 16),
                      _buildStatCard(
                        count: '1',
                        label: 'Interview',
                        color: NexoColors.accentLight,
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Applications list
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    itemCount: applications.length,
                    itemBuilder: (context, index) {
                      final application = applications[index];
                      return _buildApplicationCard(application, isDark);
                    },
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
    required Color color,
    required bool isDark,
  }) {
    return Expanded(
      child: GlassContainer(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(Map<String, dynamic> application, bool isDark) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: GlassContainer(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.business,
                    color: NexoColors.primaryLight,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application['jobTitle'] ?? 'Job Title',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        application['company'] ?? 'Company',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            Divider(
              color: isDark ? Colors.white30 : Colors.black12,
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: isDark ? Colors.white54 : Colors.black45,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Applied: ${application['date']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.white54 : Colors.black45,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: (application['statusColor'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    application['status'] ?? 'Status',
                    style: TextStyle(
                      fontSize: 12,
                      color: application['statusColor'] as Color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: NexoColors.primaryLight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Icon(Icons.visibility_outlined, size: 16),
                    label: Text('View Details'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: NexoColors.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Icon(Icons.send_outlined, size: 16),
                    label: Text('Follow Up'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}