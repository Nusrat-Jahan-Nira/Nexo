import 'package:flutter/material.dart';
import '../../../../core/util/nexo_colors.dart';
import '../../../../core/presentation/custom_view/glass_container.dart';
import '../../../../core/presentation/view/applications_screen.dart';
import '../../../../core/presentation/view/cv_screen.dart';
import 'package:nexo/feature/job/presentation/view/job_list_screen.dart';
import '../../../../core/presentation/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const JobListScreen(),
    const ApplicationsScreen(),
    const CVScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: GlassContainer(
          margin: EdgeInsets.zero,
          borderRadius: 24.0,
          color: isDark
              ? Colors.black.withValues(alpha: 0.4)
              : Colors.white.withValues(alpha: 0.8),
          blur: 15,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: NexoColors.primaryLight,
            unselectedItemColor: isDark ? Colors.white60 : Colors.black54,
            selectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            items: [
              _buildNavItem(Icons.work_outline, Icons.work, 'Jobs'),
              _buildNavItem(
                  Icons.assignment_outlined, Icons.assignment, 'Applied'),
              _buildNavItem(
                  Icons.description_outlined, Icons.description, 'CV'),
              _buildNavItem(Icons.person_outline, Icons.person, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, IconData activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: NexoColors.primaryLight.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(activeIcon),
      ),
      label: label,
    );
  }
}
