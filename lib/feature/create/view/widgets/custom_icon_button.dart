import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import './custom_image_view.dart';

/**
 * A customizable icon button widget that supports various styling options
 * including background colors, borders, shadows, and different sizes.
 *
 * @param iconPath - Path to the icon image (SVG, PNG, etc.)
 * @param onPressed - Callback function when button is pressed
 * @param width - Width of the button
 * @param height - Height of the button
 * @param padding - Internal padding of the button
 * @param backgroundColor - Background color of the button
 * @param borderRadius - Border radius for rounded corners
 * @param border - Border configuration
 * @param boxShadow - List of box shadows
 * @param iconSize - Size of the icon inside the button
 */
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onPressed,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.iconSize,
  }) : super(key: key);

  /// Path to the icon image
  final String iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Width of the button
  final double? width;

  /// Height of the button
  final double? height;

  /// Internal padding of the button
  final EdgeInsetsGeometry? padding;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border radius for rounded corners
  final BorderRadius? borderRadius;

  /// Border configuration
  final Border? border;

  /// List of box shadows
  final List<BoxShadow>? boxShadow;

  /// Size of the icon inside the button
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius ?? BorderRadius.circular(10.h),
      child: Container(
        width: width ?? 40.h,
        height: height ?? 40.h,
        padding: padding ?? EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFF23282E),
          borderRadius: borderRadius ?? BorderRadius.circular(10.h),
          border: border,
          boxShadow: boxShadow,
        ),
        child: CustomImageView(
          imagePath: iconPath,
          width: iconSize ??
              (width != null ? width! - (padding?.horizontal ?? 16.h) : 24.h),
          height: iconSize ??
              (height != null ? height! - (padding?.vertical ?? 16.h) : 24.h),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// Creates an icon button with a border
  static CustomIconButton withBorder({
    Key? key,
    required String iconPath,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    double? iconSize,
  }) {
    return CustomIconButton(
      key: key,
      iconPath: iconPath,
      onPressed: onPressed,
      width: width ?? 48.h,
      height: height ?? 50.h,
      padding: padding ?? EdgeInsets.all(12.h),
      backgroundColor: backgroundColor ?? Color(0xFF16191E),
      borderRadius: borderRadius ?? BorderRadius.circular(10.h),
      border: Border.all(
        color: borderColor ?? Color(0xFF3F3BAD),
        width: borderWidth ?? 1.h,
      ),
      boxShadow: boxShadow,
      iconSize: iconSize,
    );
  }

  /// Creates an icon button with shadow
  static CustomIconButton withShadow({
    Key? key,
    required String iconPath,
    VoidCallback? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    double? iconSize,
  }) {
    return CustomIconButton(
      key: key,
      iconPath: iconPath,
      onPressed: onPressed,
      width: width ?? 16.h,
      height: height ?? 16.h,
      padding: padding ?? EdgeInsets.all(4.h),
      backgroundColor: backgroundColor ?? Color(0xFF16191E),
      borderRadius: borderRadius ?? BorderRadius.circular(8.h),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Color(0x88888888),
          blurRadius: shadowBlurRadius ?? 15.h,
          offset: shadowOffset ?? Offset(0, 4.h),
        ),
      ],
      iconSize: iconSize,
    );
  }

  /// Creates a small icon button (16x16)
  static CustomIconButton small({
    Key? key,
    required String iconPath,
    VoidCallback? onPressed,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return CustomIconButton.withShadow(
      key: key,
      iconPath: iconPath,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      width: 16.h,
      height: 16.h,
    );
  }

  /// Creates a medium icon button (40x40)
  static CustomIconButton medium({
    Key? key,
    required String iconPath,
    VoidCallback? onPressed,
    Color? backgroundColor,
  }) {
    return CustomIconButton(
      key: key,
      iconPath: iconPath,
      onPressed: onPressed,
      width: 40.h,
      height: 40.h,
      backgroundColor: backgroundColor,
    );
  }

  /// Creates a large icon button with border (48x50)
  static CustomIconButton large({
    Key? key,
    required String iconPath,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return CustomIconButton.withBorder(
      key: key,
      iconPath: iconPath,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
    );
  }
}
