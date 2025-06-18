import 'package:flutter/material.dart';
import '../../../../core/util/nexo_colors.dart';
import '../../domain/req_model/login_request.dart';
import '../controller/auth_controller.dart';
import '../../../../core/presentation/custom_view/glass_container.dart';
import '../../../dashboard/presentation/view/home_screen.dart';
import '../../../../core/presentation/view/registration_screen.dart';


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Interval(0.0, 0.65, curve: Curves.easeOut),
//       ),
//     );
//
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _attemptLogin() {
//     if (_formKey.currentState!.validate()) {
//       // This is UI only, so we'll just navigate to home screen
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => const HomeScreen())
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background design with animated gradient
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: isDark
//                     ? [Color(0xFF2B2B3B), Color(0xFF1A1A2E)]
//                     : [Color(0xFFEAF0FF), Color(0xFFDFE9F9)],
//               ),
//             ),
//           ),
//
//           // Background shapes
//           Positioned(
//             top: -size.height * 0.1,
//             left: -size.width * 0.1,
//             child: Container(
//               height: size.height * 0.3,
//               width: size.height * 0.3,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: NexoColors.primaryLight.withOpacity(0.3),
//               ),
//             ),
//           ),
//
//           Positioned(
//             bottom: -size.height * 0.1,
//             right: -size.width * 0.2,
//             child: Container(
//               height: size.height * 0.4,
//               width: size.height * 0.4,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: NexoColors.accentLight.withOpacity(0.3),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: size.height * 0.3,
//             left: -size.width * 0.1,
//             child: Container(
//               height: size.height * 0.1,
//               width: size.height * 0.1,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.amber.withOpacity(0.2),
//               ),
//             ),
//           ),
//
//           // Content
//           SafeArea(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.08),
//
//                     // Logo and title animation
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: Offset(0, 0.5),
//                           end: Offset.zero,
//                         ).animate(_animationController),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
//                               ),
//                               child: Icon(
//                                 Icons.work_outline,
//                                 size: 50,
//                                 color: NexoColors.primaryLight,
//                               ),
//                             ),
//                             SizedBox(height: 24),
//                             Text(
//                               'Welcome to Nexo',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Sign in to continue',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isDark ? Colors.white70 : Colors.black54,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: size.height * 0.06),
//
//                     // Login form with glass effect
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: Offset(0, 0.3),
//                           end: Offset.zero,
//                         ).animate(
//                           CurvedAnimation(
//                             parent: _animationController,
//                             curve: Interval(0.3, 0.8, curve: Curves.easeOut),
//                           ),
//                         ),
//                         child: GlassContainer(
//                           color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
//                           boxShadow: [
//                             BoxShadow(
//                               color: isDark
//                                   ? Colors.black.withOpacity(0.2)
//                                   : Colors.grey.withOpacity(0.2),
//                               blurRadius: 15,
//                               offset: Offset(0, 10),
//                             ),
//                           ],
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 // Email field
//                                 TextFormField(
//                                   controller: _emailController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white : Colors.black87,
//                                   ),
//                                   decoration: InputDecoration(
//                                     labelText: 'Email',
//                                     prefixIcon: Icon(Icons.email_outlined),
//                                     hintText: 'Enter your email address',
//                                     fillColor: isDark
//                                         ? Colors.white.withOpacity(0.05)
//                                         : Colors.black.withOpacity(0.03),
//                                     filled: true,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     labelStyle: TextStyle(
//                                       color: isDark ? Colors.white70 : Colors.black54,
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: isDark ? Colors.white30 : Colors.black38,
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your email';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Password field
//                                 TextFormField(
//                                   controller: _passwordController,
//                                   obscureText: _obscurePassword,
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white : Colors.black87,
//                                   ),
//                                   decoration: InputDecoration(
//                                     labelText: 'Password',
//                                     prefixIcon: Icon(Icons.lock_outline),
//                                     hintText: 'Enter your password',
//                                     fillColor: isDark
//                                         ? Colors.white.withOpacity(0.05)
//                                         : Colors.black.withOpacity(0.03),
//                                     filled: true,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     labelStyle: TextStyle(
//                                       color: isDark ? Colors.white70 : Colors.black54,
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: isDark ? Colors.white30 : Colors.black38,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                                         color: isDark ? Colors.white54 : Colors.black45,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _obscurePassword = !_obscurePassword;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your password';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: TextButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       'Forgot Password?',
//                                       style: TextStyle(
//                                         color: NexoColors.primaryLight,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 SizedBox(height: 24),
//
//                                 // Login button with animated gradient
//                                 Container(
//                                   width: double.infinity,
//                                   height: 56,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(16),
//                                     gradient: LinearGradient(
//                                       colors: NexoColors.primaryGradient,
//                                       begin: Alignment.centerLeft,
//                                       end: Alignment.centerRight,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: NexoColors.primaryLight.withOpacity(0.4),
//                                         blurRadius: 12,
//                                         offset: Offset(0, 4),
//                                       ),
//                                     ],
//                                   ),
//                                   child: ElevatedButton(
//                                     onPressed: _attemptLogin,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.transparent,
//                                       shadowColor: Colors.transparent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       'Login',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 24),
//
//                     // Social login options
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: Offset(0, 0.2),
//                           end: Offset.zero,
//                         ).animate(
//                           CurvedAnimation(
//                             parent: _animationController,
//                             curve: Interval(0.5, 1.0, curve: Curves.easeOut),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                                   child: Text(
//                                     'Or continue with',
//                                     style: TextStyle(
//                                       color: isDark ? Colors.white54 : Colors.black45,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
//                               ],
//                             ),
//
//                             SizedBox(height: 24),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _socialLoginButton(icon: Icons.g_mobiledata, color: Color(0xFFDB4437)),
//                                 SizedBox(width: 24),
//                                 _socialLoginButton(icon: Icons.facebook, color: Color(0xFF4267B2)),
//                                 SizedBox(width: 24),
//                                 _socialLoginButton(icon: Icons.apple, color: isDark ? Colors.white : Colors.black),
//                               ],
//                             ),
//
//                             SizedBox(height: 32),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Don\'t have an account? ',
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white70 : Colors.black54,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (_) => RegistrationScreen()),
//                                     );
//                                   },
//                                   child: Text(
//                                     'Sign Up',
//                                     style: TextStyle(
//                                       color: NexoColors.primaryLight,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _socialLoginButton({required IconData icon, required Color color}) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     return GlassContainer(
//       height: 56,
//       width: 56,
//       padding: EdgeInsets.zero,
//       color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
//       child: IconButton(
//         icon: Icon(icon, color: color, size: 28),
//         onPressed: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/presentation/custom_view/glass_container.dart';
import '../../../dashboard/presentation/view/home_screen.dart';
import '../../../../core/presentation/view/registration_screen.dart';

//**********************version 2 with Riverpod state management**********************//

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends ConsumerState<LoginScreen> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
//       ),
//     );
//
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _attemptLogin() async {
//     if (_formKey.currentState!.validate()) {
//       final authController = ref.read(authControllerProvider.notifier);
//       await authController.login(
//         _emailController.text.trim(),
//         _passwordController.text,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     final authState = ref.watch(authControllerProvider);
//
//     // Handle navigation when authenticated
//     if (authState.isAuthenticated) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => const HomeScreen())
//         );
//       });
//     }
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background design with animated gradient
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: isDark
//                     ? [Color(0xFF2B2B3B), Color(0xFF1A1A2E)]
//                     : [Color(0xFFEAF0FF), Color(0xFFDFE9F9)],
//               ),
//             ),
//           ),
//
//           // Background shapes
//           Positioned(
//             top: -size.height * 0.1,
//             left: -size.width * 0.1,
//             child: Container(
//               height: size.height * 0.3,
//               width: size.height * 0.3,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: NexoColors.primaryLight.withOpacity(0.3),
//               ),
//             ),
//           ),
//
//           Positioned(
//             bottom: -size.height * 0.1,
//             right: -size.width * 0.2,
//             child: Container(
//               height: size.height * 0.4,
//               width: size.height * 0.4,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: NexoColors.accentLight.withOpacity(0.3),
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: size.height * 0.3,
//             left: -size.width * 0.1,
//             child: Container(
//               height: size.height * 0.1,
//               width: size.height * 0.1,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.amber.withOpacity(0.2),
//               ),
//             ),
//           ),
//
//           // Content
//           SafeArea(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.08),
//
//                     // Logo and title animation
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: const Offset(0, 0.5),
//                           end: Offset.zero,
//                         ).animate(_animationController),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
//                               ),
//                               child: Icon(
//                                 Icons.work_outline,
//                                 size: 50,
//                                 color: NexoColors.primaryLight,
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             Text(
//                               'Welcome to Nexo',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Sign in to continue',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isDark ? Colors.white70 : Colors.black54,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: size.height * 0.06),
//
//                     // Error message if any
//                     if (authState.errorMessage != null)
//                       Container(
//                         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         margin: const EdgeInsets.only(bottom: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.red.shade50,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.red.shade200),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.error_outline, color: Colors.red.shade700),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 authState.errorMessage!,
//                                 style: TextStyle(color: Colors.red.shade700),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     // Login form with glass effect
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: const Offset(0, 0.3),
//                           end: Offset.zero,
//                         ).animate(
//                           CurvedAnimation(
//                             parent: _animationController,
//                             curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
//                           ),
//                         ),
//                         child: GlassContainer(
//                           color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
//                           boxShadow: [
//                             BoxShadow(
//                               color: isDark
//                                   ? Colors.black.withOpacity(0.2)
//                                   : Colors.grey.withOpacity(0.2),
//                               blurRadius: 15,
//                               offset: const Offset(0, 10),
//                             ),
//                           ],
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 // Email field
//                                 TextFormField(
//                                   controller: _emailController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white : Colors.black87,
//                                   ),
//                                   decoration: InputDecoration(
//                                     labelText: 'Email',
//                                     prefixIcon: const Icon(Icons.email_outlined),
//                                     hintText: 'Enter your email address',
//                                     fillColor: isDark
//                                         ? Colors.white.withOpacity(0.05)
//                                         : Colors.black.withOpacity(0.03),
//                                     filled: true,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     labelStyle: TextStyle(
//                                       color: isDark ? Colors.white70 : Colors.black54,
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: isDark ? Colors.white30 : Colors.black38,
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your email';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//
//                                 const SizedBox(height: 20),
//
//                                 // Password field
//                                 TextFormField(
//                                   controller: _passwordController,
//                                   obscureText: _obscurePassword,
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white : Colors.black87,
//                                   ),
//                                   decoration: InputDecoration(
//                                     labelText: 'Password',
//                                     prefixIcon: const Icon(Icons.lock_outline),
//                                     hintText: 'Enter your password',
//                                     fillColor: isDark
//                                         ? Colors.white.withOpacity(0.05)
//                                         : Colors.black.withOpacity(0.03),
//                                     filled: true,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     labelStyle: TextStyle(
//                                       color: isDark ? Colors.white70 : Colors.black54,
//                                     ),
//                                     hintStyle: TextStyle(
//                                       color: isDark ? Colors.white30 : Colors.black38,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                                         color: isDark ? Colors.white54 : Colors.black45,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _obscurePassword = !_obscurePassword;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your password';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: TextButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       'Forgot Password?',
//                                       style: TextStyle(
//                                         color: NexoColors.primaryLight,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 24),
//
//                                 // Login button with animated gradient
//                                 Container(
//                                   width: double.infinity,
//                                   height: 56,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(16),
//                                     gradient: LinearGradient(
//                                       colors: NexoColors.primaryGradient,
//                                       begin: Alignment.centerLeft,
//                                       end: Alignment.centerRight,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: NexoColors.primaryLight.withOpacity(0.4),
//                                         blurRadius: 12,
//                                         offset: const Offset(0, 4),
//                                       ),
//                                     ],
//                                   ),
//                                   child: ElevatedButton(
//                                     onPressed: authState.isLoading ? null : _attemptLogin,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.transparent,
//                                       shadowColor: Colors.transparent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(16),
//                                       ),
//                                     ),
//                                     child: authState.isLoading
//                                         ? const SizedBox(
//                                             height: 24,
//                                             width: 24,
//                                             child: CircularProgressIndicator(
//                                               color: Colors.white,
//                                               strokeWidth: 2,
//                                             ),
//                                           )
//                                         : const Text(
//                                             'Login',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     // Social login options
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: Tween<Offset>(
//                           begin: const Offset(0, 0.2),
//                           end: Offset.zero,
//                         ).animate(
//                           CurvedAnimation(
//                             parent: _animationController,
//                             curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                                   child: Text(
//                                     'Or continue with',
//                                     style: TextStyle(
//                                       color: isDark ? Colors.white54 : Colors.black45,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
//                               ],
//                             ),
//
//                             const SizedBox(height: 24),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _socialLoginButton(icon: Icons.g_mobiledata, color: const Color(0xFFDB4437)),
//                                 const SizedBox(width: 24),
//                                 _socialLoginButton(icon: Icons.facebook, color: const Color(0xFF4267B2)),
//                                 const SizedBox(width: 24),
//                                 _socialLoginButton(icon: Icons.apple, color: isDark ? Colors.white : Colors.black),
//                               ],
//                             ),
//
//                             const SizedBox(height: 32),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Don\'t have an account? ',
//                                   style: TextStyle(
//                                     color: isDark ? Colors.white70 : Colors.black54,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (_) => RegistrationScreen()),
//                                     );
//                                   },
//                                   child: Text(
//                                     'Sign Up',
//                                     style: TextStyle(
//                                       color: NexoColors.primaryLight,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _socialLoginButton({required IconData icon, required Color color}) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     return GlassContainer(
//       height: 56,
//       width: 56,
//       padding: EdgeInsets.zero,
//       color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
//       child: IconButton(
//         icon: Icon(icon, color: color, size: 28),
//         onPressed: () {},
//       ),
//     );
//   }
// }

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = ref.watch(authControllerProvider);
    //final isPasswordObscured = ref.watch(passwordVisibilityProvider);

    // Handle navigation when authenticated
    if (authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen())
        );
      });
    }

    _emailController.text = "abc@gmail.com";
    _passwordController.text = "Abc@123456";

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [Color(0xFF2B2B3B), Color(0xFF1A1A2E)]
                    : [Color(0xFFEAF0FF), Color(0xFFDFE9F9)],
              ),
            ),
          ),

          // Background shapes
          Positioned(
            top: -size.height * 0.1,
            left: -size.width * 0.1,
            child: Container(
              height: size.height * 0.3,
              width: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.primaryLight.withOpacity(0.3),
              ),
            ),
          ),

          Positioned(
            bottom: -size.height * 0.1,
            right: -size.width * 0.2,
            child: Container(
              height: size.height * 0.4,
              width: size.height * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NexoColors.accentLight.withOpacity(0.3),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.3,
            left: -size.width * 0.1,
            child: Container(
              height: size.height * 0.1,
              width: size.height * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.withOpacity(0.2),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.08),

                    // Logo and title with implicit animations
                    AnimatedSlide(
                      offset: const Offset(0, 0),
                      duration: const Duration(milliseconds: 800),
                      child: AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
                              ),
                              child: Icon(
                                Icons.work_outline,
                                size: 50,
                                color: NexoColors.primaryLight,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Welcome to Nexo',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sign in to continue',
                              style: TextStyle(
                                fontSize: 16,
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.06),

                    // Error message if any
                    if (authState.errorMessage != null)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade700),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                authState.errorMessage!,
                                style: TextStyle(color: Colors.red.shade700),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Login form with glass effect
                    AnimatedSlide(
                      offset: const Offset(0, 0),
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: GlassContainer(
                          color: isDark ? NexoColors.glassDark : NexoColors.glassLight,
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? Colors.black.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Email field
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.email_outlined),
                                    hintText: 'Enter your email address',
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
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 20),

                                // Password field
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: authState.isPasswordVisible,
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    hintText: 'Enter your password',
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
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        authState.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                        color: isDark ? Colors.white54 : Colors.black45,
                                      ),
                                      onPressed: () => ref.read(authControllerProvider.notifier).togglePasswordVisibility(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: NexoColors.primaryLight,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Login button with animated gradient
                                Container(
                                  width: double.infinity,
                                  height: 56,
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
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: authState.isLoading ? null : () => _attemptLogin(ref),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: authState.isLoading
                                        ? const SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 16,
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
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Social login options
                    AnimatedSlide(
                      offset: const Offset(0, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 1200),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      color: isDark ? Colors.white54 : Colors.black45,
                                    ),
                                  ),
                                ),
                                Expanded(child: Divider(color: isDark ? Colors.white30 : Colors.black26)),
                              ],
                            ),

                            const SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialLoginButton(icon: Icons.g_mobiledata, color: const Color(0xFFDB4437), context: context),
                                const SizedBox(width: 24),
                                _socialLoginButton(icon: Icons.facebook, color: const Color(0xFF4267B2), context: context),
                                const SizedBox(width: 24),
                                _socialLoginButton(icon: Icons.apple, color: isDark ? Colors.white : Colors.black, context: context),
                              ],
                            ),

                            const SizedBox(height: 32),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: isDark ? Colors.white70 : Colors.black54,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => RegistrationScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _attemptLogin(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      final authController = ref.read(authControllerProvider.notifier);
      final loginRequest = LoginRequest(email: _emailController.text.trim(), password:  _passwordController.text,);
      await authController.login(loginRequest);
    }
  }

  Widget _socialLoginButton({required IconData icon, required Color color, required BuildContext context}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GlassContainer(
      height: 56,
      width: 56,
      padding: EdgeInsets.zero,
      color: isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.8),
      child: IconButton(
        icon: Icon(icon, color: color, size: 28),
        onPressed: () {},
      ),
    );
  }
}

// // Provider for password visibility state
// final passwordVisibilityProvider = StateNotifierProvider<BoolNotifier, bool>((ref) {
//   return BoolNotifier(true);
// });
//
// class BoolNotifier extends StateNotifier<bool> {
//   BoolNotifier(bool state) : super(state);
//
//   void toggle() => state = !state;
// }