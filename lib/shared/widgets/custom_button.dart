import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import '../../core/style/app_colors.dart';
import 'text_helper.dart';
///
/// Arguments:
/// - [text]: The button text to display (required)
/// - [onPressed]: Callback function when button is pressed (required)
/// - [width]: Button width, can be flexible or fixed (optional)
/// - [backgroundColor]: Background color for the button (optional)
/// - [borderColor]: Border color for the button (optional)
/// - [textColor]: Text color for the button (optional)
/// - [isEnabled]: Whether the button is enabled or disabled (optional, defaults to true)
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.isEnabled,
  }) : super(key: key);

  /// The text to display on the button
  final String text;

  /// Callback function triggered when the button is pressed
  final VoidCallback? onPressed;

  /// Width of the button - can be null for flexible width
  final double? width;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border color of the button
  final Color? borderColor;

  /// Text color of the button
  final Color? textColor;

  /// Whether the button is enabled or disabled
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled ?? true;
    final Color defaultTextColor = textColor ?? appTheme.whiteCustom;
    final Color? bgColor = backgroundColor;
    final Color? bColor = borderColor;

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return bgColor?.withAlpha(128);
              }
              return bgColor ?? appTheme.transparentCustom;
            },
          ),
          foregroundColor: WidgetStateProperty.all<Color>(defaultTextColor),
          side: bColor != null
              ? WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: bColor,
              width: 1.h,
            ),
          )
              : null,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.h),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 30.h,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return (bgColor ?? defaultTextColor).withAlpha(26);
              }
              return null;
            },
          ),
        ),
        child: Text(
          text,
          style: TextStyleHelper.instance.body14BoldCairo
              .copyWith(height: 27.h / 14.fSize),
        ),
      ),
    );
  }
}
