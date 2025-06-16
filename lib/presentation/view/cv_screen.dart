import 'package:flutter/material.dart';
import '../../core/nexo_colors.dart';
import '../custom_view/glass_container.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  int _selectedTemplate = 0;

  // Sample CV template data
  final List<Map<String, dynamic>> _templates = [
    {
      'name': 'Professional',
      'color': NexoColors.primaryLight,
      'thumbnail': 'assets/images/cv_template_1.png', // Placeholder
      'description': 'Clean and professional template suitable for most industries',
    },
    {
      'name': 'Creative',
      'color': Colors.orange,
      'thumbnail': 'assets/images/cv_template_2.png', // Placeholder
      'description': 'Creative design perfect for roles in design, marketing, and arts',
    },
    {
      'name': 'Modern',
      'color': Colors.teal,
      'thumbnail': 'assets/images/cv_template_3.png', // Placeholder
      'description': 'Contemporary layout with a focus on skills and achievements',
    },
    {
      'name': 'Simple',
      'color': Colors.indigo,
      'thumbnail': 'assets/images/cv_template_4.png', // Placeholder
      'description': 'Minimalist design focusing on clarity and readability',
    },
  ];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'CV Manager',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
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
                        // CV Preview card
                        GlassContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'My CV',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: NexoColors.successLight.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      'Active',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: NexoColors.successLight,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 16),

                              // CV Preview
                              Container(
                                height: 320,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isDark ? Colors.white24 : Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.description_outlined,
                                      size: 64,
                                      color: NexoColors.primaryLight,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'John_Doe_Resume_2025.pdf',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Last updated: June 10, 2025',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isDark ? Colors.white70 : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20),

                              // Action buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 12),
                                        side: BorderSide(color: NexoColors.primaryLight),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: Icon(Icons.edit_outlined, size: 16),
                                      label: Text('Edit CV'),
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
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: Icon(Icons.download_outlined, size: 16),
                                      label: Text('Download'),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12),

                              ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: NexoColors.primaryLight,
                                  elevation: 0,
                                ),
                                icon: Icon(Icons.share_outlined, size: 16),
                                label: Text('Share CV'),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Template section header
                        Text(
                          'Choose a Template',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          'Select a professional template for your CV',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),

                        SizedBox(height: 16),

                        // Templates grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: _templates.length,
                          itemBuilder: (context, index) {
                            final template = _templates[index];
                            final isSelected = _selectedTemplate == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedTemplate = index;
                                });
                              },
                              child: GlassContainer(
                                color: isDark
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.white.withOpacity(0.6),
                                borderRadius: 16,
                                padding: EdgeInsets.all(12),
                                border: isSelected
                                    ? Border.all(
                                  color: template['color'],
                                  width: 2,
                                )
                                    : null,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: template['color'].withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: template['color'].withOpacity(0.2),
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.description_outlined,
                                            size: 48,
                                            color: template['color'],
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 12),

                                    Text(
                                      template['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    Text(
                                      template['description'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isDark ? Colors.white70 : Colors.black54,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    SizedBox(height: 8),

                                    if (isSelected)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: template['color'].withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  size: 16,
                                                  color: template['color'],
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  'Selected',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: template['color'],
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 32),

                        // Action button
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: NexoColors.primaryGradient,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: NexoColors.primaryLight.withOpacity(0.4),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Create New CV',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
}