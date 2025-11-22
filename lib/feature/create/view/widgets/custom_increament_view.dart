import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import '../../../../core/resources/svg.dart';
import './custom_image_view.dart';

/**
 * CustomIncrementView - A reusable increment button component with customizable styling.
 *
 * Features:
 * - Customizable icon path for different increment types
 * - Configurable dimensions and colors
 * - Touch feedback with onTap callback
 * - Responsive design with proper scaling
 * - Support for disabled state
 *
 * @param iconPath - Path to the icon asset (SVG/PNG)
 * @param onTap - Callback function when the increment button is tapped
 * @param width - Width of the increment view
 * @param height - Height of the increment view
 * @param backgroundColor - Background color of the container
 * @param padding - Internal padding around the icon
 * @param isEnabled - Whether the increment view is interactive
 */
class CustomIncrementView extends StatelessWidget {
  CustomIncrementView({
    Key? key,
    this.iconPath,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.isEnabled,
  }) : super(key: key);

  /// Path to the icon asset (SVG/PNG)
  final String? iconPath;

  /// Callback function when the increment button is tapped
  final VoidCallback? onTap;

  /// Width of the increment view
  final double? width;

  /// Height of the increment view
  final double? height;

  /// Background color of the container
  final Color? backgroundColor;

  /// Internal padding around the icon
  final EdgeInsetsGeometry? padding;

  /// Whether the increment view is interactive
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isEnabled ?? true) ? onTap : null,
      child: Container(
        width: width ?? 24.h,
        height: height ?? 24.h,
        padding: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Center(
          child: CustomImageView(
            imagePath:
            iconPath ?? SvgAssets.all,
            width: (width ?? 24.h) - (padding?.horizontal ?? 0),
            height: (height ?? 24.h) - (padding?.vertical ?? 0),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
