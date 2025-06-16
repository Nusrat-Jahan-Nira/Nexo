import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;

  const GlassContainer({
    Key? key,
    required this.child,
    this.borderRadius = 16.0,
    this.blur = 10.0,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.border,
    this.boxShadow,
    this.gradient,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ?? Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              gradient: gradient ?? LinearGradient(
                begin: gradientBegin!,
                end: gradientEnd!,
                colors: [
                  color.withOpacity(0.5),
                  color.withOpacity(0.2),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}