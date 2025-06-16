import 'package:flutter/material.dart';
import '../../core/nexo_colors.dart';
import '../custom_view/glass_container.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  int _currentStep = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: isDark
                    ? [Color(0xFF2B2B3B), Color(0xFF1A1A2E)]
                    : [Color(0xFFE4EBFF), Color(0xFFCFDDFB)],
              ),
            ),
          ),

          // Background shapes
          Positioned(
            top: -size.height * 0.15,
            right: -size.width * 0.1,
            child: Container(
              height: size.height * 0.3,
              width: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.accentLight.withOpacity(0.3),
              ),
            ),
          ),

          Positioned(
            bottom: -size.height * 0.05,
            left: -size.width * 0.2,
            child: Container(
              height: size.height * 0.25,
              width: size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.primaryLight.withOpacity(0.25),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
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

                    SizedBox(height: 32),

                    // Title
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Join Nexo to find your dream job',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),

                    SizedBox(height: 40),

                    // Registration form with glass effect
                    GlassContainer(
                      color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                        ),
                      ],
                      child: Column(
                        children: [
                          // Registration progress indicator
                          Row(
                            children: [
                              _buildProgressIndicator(1, _currentStep >= 0, 'Account'),
                              _buildProgressLine(_currentStep >= 1),
                              _buildProgressIndicator(2, _currentStep >= 1, 'Profile'),
                              _buildProgressLine(_currentStep >= 2),
                              _buildProgressIndicator(3, _currentStep >= 2, 'Skills'),
                            ],
                          ),

                          SizedBox(height: 30),

                          // Form content based on current step
                          if (_currentStep == 0)
                            _buildAccountInfoForm(isDark)
                          else if (_currentStep == 1)
                            _buildProfileInfoForm(isDark)
                          else
                            _buildSkillsForm(isDark),

                          SizedBox(height: 30),

                          // Navigation buttons
                          Row(
                            children: [
                              if (_currentStep > 0)
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentStep--;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: NexoColors.primaryLight),
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Previous',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                              if (_currentStep > 0)
                                SizedBox(width: 16),

                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
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
                                    onPressed: () {
                                      if (_currentStep < 2) {
                                        setState(() {
                                          _currentStep++;
                                        });
                                      } else {
                                        // Submit registration
                                      }
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
                                      _currentStep < 2 ? 'Next' : 'Create Account',
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
                        ],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Sign in link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: NexoColors.primaryLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(int step, bool isActive, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? NexoColors.primaryLight : Colors.grey.withOpacity(0.3),
              boxShadow: isActive ? [
                BoxShadow(
                  color: NexoColors.primaryLight.withOpacity(0.4),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ] : null,
            ),
            child: Center(
              child: Text(
                step.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive ? NexoColors.primaryLight : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Container(
      height: 2,
      width: 30,
      color: isActive ? NexoColors.primaryLight : Colors.grey.withOpacity(0.3),
    );
  }

  Widget _buildAccountInfoForm(bool isDark) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),

          // Email field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: _inputDecoration(
              label: 'Email Address',
              hint: 'Enter your email address',
              icon: Icons.email_outlined,
              isDark: isDark,
            ),
          ),

          SizedBox(height: 20),

          // Password field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: _inputDecoration(
              label: 'Password',
              hint: 'Enter your password',
              icon: Icons.lock_outline,
              isDark: isDark,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          // Confirm password field
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            decoration: _inputDecoration(
              label: 'Confirm Password',
              hint: 'Confirm your password',
              icon: Icons.lock_outline,
              isDark: isDark,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoForm(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24),

        // Full Name field
        TextFormField(
          controller: _nameController,
          decoration: _inputDecoration(
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline,
            isDark: isDark,
          ),
        ),

        SizedBox(height: 20),

        // Phone number field
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: _inputDecoration(
            label: 'Phone Number',
            hint: 'Enter your phone number',
            icon: Icons.phone_outlined,
            isDark: isDark,
          ),
        ),

        SizedBox(height: 20),

        // Location field
        TextFormField(
          decoration: _inputDecoration(
            label: 'Location',
            hint: 'Enter your city',
            icon: Icons.location_on_outlined,
            isDark: isDark,
          ),
        ),

        SizedBox(height: 20),

        // Professional Title
        TextFormField(
          decoration: _inputDecoration(
            label: 'Professional Title',
            hint: 'e.g. UI/UX Designer',
            icon: Icons.work_outline,
            isDark: isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsForm(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Experience',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24),

        // Skills input
        TextFormField(
          decoration: _inputDecoration(
            label: 'Skills',
            hint: 'Add skills separated by commas',
            icon: Icons.auto_awesome,
            isDark: isDark,
          ),
        ),

        SizedBox(height: 20),

        // Experience level
        Text(
          'Experience Level',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 12),

        // Experience level options
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            'Entry Level',
            'Junior',
            'Mid-Level',
            'Senior',
            'Expert'
          ].map((level) => _buildSelectionChip(level, level == 'Mid-Level', isDark)).toList(),
        ),

        SizedBox(height: 20),

        // Resume upload
        GlassContainer(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 40,
                color: NexoColors.primaryLight,
              ),
              SizedBox(height: 12),
              Text(
                'Upload your resume/CV',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'PDF, DOCX or RTF (Max 5MB)',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: NexoColors.primaryLight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Choose File'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectionChip(String label, bool isSelected, bool isDark) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // Handle selection
      },
      backgroundColor: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
      selectedColor: NexoColors.primaryLight.withOpacity(0.2),
      labelStyle: TextStyle(
        color: isSelected ? NexoColors.primaryLight : (isDark ? Colors.white70 : Colors.black54),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: isDark ? Colors.white54 : Colors.black45,
      ),
      suffixIcon: suffixIcon,
      fillColor: isDark
          ? Colors.white.withOpacity(0.05)
          : Colors.black.withOpacity(0.03),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      labelStyle: TextStyle(
        color: isDark ? Colors.white70 : Colors.black54,
      ),
      hintStyle: TextStyle(
        color: isDark ? Colors.white30 : Colors.black38,
      ),
    );
  }
}