import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatefulWidget {
  const SharedButton({
    super.key,
    this.title = '',
    this.titleColor,
    this.textStyle,
    this.backgroundColor,
    this.height,
    this.width,
    this.onPressed,
    this.maxLines,
    this.overflow,
    this.borderColor,
    this.borderWidth,
    this.child,
    this.borderRadius,
    this.foregroundColor,
    this.padding,
    this.fontSize,
    this.fontWeight,
  });

  final String title;
  final Color? titleColor, backgroundColor;
  final Widget? child;
  final double? height, width;
  final FutureOr<dynamic> Function()? onPressed;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;

  const SharedButton.fromTitleColor({
    super.key,
    this.title = '',
    this.borderColor,
    this.borderWidth,
    this.titleColor = Colors.black,
    this.backgroundColor,
    this.onPressed,
    this.textStyle,
    this.maxLines,
    this.overflow,
    this.child,
    this.borderRadius,
    this.foregroundColor,
    this.padding,
    this.fontSize,
    this.fontWeight,
  })  : height = null,
        width = null;

  const SharedButton.fromBackgroundColor({
    super.key,
    this.title = '',
    this.titleColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textStyle,
    this.backgroundColor = const Color(0xffF4C700),
    this.onPressed,
    this.maxLines,
    this.overflow,
    this.child,
    this.foregroundColor,
    this.padding,
    this.fontSize,
    this.fontWeight,
  })  : height = null,
        width = null;

  @override
  State<SharedButton> createState() => _SharedButtonState();
}

class _SharedButtonState extends State<SharedButton> {
  bool busy = false;

  // set busy state
  void setBusy(bool value) {
    setState(() {
      busy = value;
    });
  }

  // set ready state
  void setReady() {
    setState(() {
      busy = false;
    });
  }

  Widget _buildBusy() {
    return Container(
      width: widget.width ?? 305,
      height: widget.height ?? 52,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return busy
        ? _buildBusy()
        : SizedBox(
      width: widget.width ?? 305,
      height: widget.height ?? 52,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          final futureOr = widget.onPressed!();
          if (futureOr is Future) {
            setBusy(true);
            futureOr.whenComplete(() => setReady());
          }
        },
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(BorderSide(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 0.0)),
          backgroundColor: WidgetStateProperty.all<Color>(
              widget.backgroundColor ?? Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
              widget.foregroundColor ?? Colors.white),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            widget.padding ?? EdgeInsets.zero,
          ),
        ),
        child: widget.child ??
            AutoSizeText(
              widget.title,
              maxLines: widget.maxLines ?? 1,
              overflow: widget.overflow ?? TextOverflow.ellipsis,
              style: widget.textStyle ??
                  TextStyle(
                    fontSize: widget.fontSize ?? 16,
                    color: Colors.white,
                    fontWeight: widget.fontWeight ?? FontWeight.w600,
                    fontFamily: 'Gotham',
                  ),
            ),
      ),
    );
  }
}
