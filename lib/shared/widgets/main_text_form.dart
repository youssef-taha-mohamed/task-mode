import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/style/app_colors.dart';
import 'main_text.dart';

class MainTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final String? titleLabel;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final IconData? prefixIcons;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final bool unFocusWhenTapOutside;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final BoxConstraints? prefixIconConstraints;
  final String? initialCode;
  final String? helperText;
  final String? autofillHints;
  final bool showClearButton;
  final bool autofocus;
  final TextDirection? textDirection;
  final TextCapitalization? textCapitalization;
  final BorderRadius? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final double spacing;
  final Color? hintColor;
  final bool onlyEnglishLetters;

  const MainTextField({
    super.key,
    this.hint,
    this.titleLabel,
    this.label,
    this.textStyle,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.isDense = true,
    this.contentPadding,
    this.readOnly = false,
    this.enabled = true,
    this.currentFocusNode,
    this.unFocusWhenTapOutside = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.initialCode,
    this.helperText,
    this.prefixIconConstraints,
    this.autofillHints,
    this.showClearButton = true,
    this.autofocus = false,
    this.labelStyle,
    this.textDirection,
    this.prefixIcons,
    this.nextFocusNode,
    this.textCapitalization,
    this.borderRadius,
    this.inputFormatters,
    this.border,
    this.hintColor,
    this.spacing = 2,
    this.onlyEnglishLetters = false,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool _obscureText;
  late TextEditingController _controller;
  bool _hasText = false;
  late FocusNode _focusNode;
  String? _errorMessage;
  bool _wasValidated = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _focusNode = widget.currentFocusNode ?? FocusNode();

    // Add listeners
    _controller.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;

      // When field loses focus, validate if it has content
      if (!_isFocused) {
        _wasValidated = true;
        if (_controller.text.isEmpty) {
          _errorMessage = widget.validator?.call(_controller.text);
        } else {
          _errorMessage = null;
        }
      }
    });
  }

  void _handleTextChange() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;

      // Clear error message immediately when typing starts
      if (_hasText) {
        _errorMessage = null;
      } else if (_wasValidated) {
        // Show error if field was previously validated and is now empty
        _errorMessage = widget.validator?.call(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChange);
    }
    if (widget.currentFocusNode == null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    super.dispose();
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () => setState(() => _obscureText = !_obscureText),
        icon: Icon(
          _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          size: 20,
        ),
      );
    } else if (widget.showClearButton && _hasText) {
      return IconButton(
        onPressed: () {
          _controller.clear();
          if (widget.onChanged != null) {
            widget.onChanged!('');
          }
        },
        icon: const Icon(CupertinoIcons.clear_circled_solid, size: 20),
      );
    } else {
      return widget.suffixIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> formatters = [...?widget.inputFormatters];
    if (widget.onlyEnglishLetters) {
      formatters.add(
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleLabel != null && widget.titleLabel != '') ...[
          MainText(
            widget.titleLabel ?? '',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: MyColors.white,
          ),
          SizedBox(
            height: widget.spacing,
          ),
        ],
        TextFormField(
          autofillHints:
          widget.autofillHints != null ? [widget.autofillHints!] : null,
          controller: _controller,
          focusNode: _focusNode,
          style: widget.textStyle ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.white,
                fontFamily: 'Cairo',
              ),
          textDirection: widget.textDirection,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          obscureText: _obscureText,
          autofocus: widget.autofocus,
          inputFormatters: formatters,
          textCapitalization:
          widget.textCapitalization ?? TextCapitalization.none,
          validator: (value) {
            if (widget.validator != null) {
              _wasValidated = true;
              _errorMessage = widget.validator!(value);
              if (mounted) {
                setState(() {});
              }
              return _errorMessage;
            }
            return null;
          },
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onFieldSubmitted: widget.onSubmitted ??
                  (String value) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              },
          onTap: widget.onTap,
          onTapOutside: (event) {
            if (widget.unFocusWhenTapOutside) {
              FocusScope.of(context).unfocus();
            }
          },
          decoration: InputDecoration(
            label: widget.label != null
                ? Text(
              widget.label!,
              style: widget.labelStyle ??
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white,
                    fontFamily: 'Cairo',
                  ),
            )
                : null,
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MyColors.white,
              fontFamily: 'Cairo',
            ),
            helperText: widget.helperText,
            errorText: _errorMessage,
            filled: true,
            fillColor: MyColors.fillColor,
            prefixIconConstraints: widget.prefixIconConstraints,
            isDense: widget.isDense,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: widget.prefixIcon != null
                ? Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              // decoration: BoxDecoration(
              //   color: MyColors.primaryColor.withValues(alpha: 0.1),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              child: widget.prefixIcons == null
                  ? widget.prefixIcon
                  : Icon(
                widget.prefixIcons,
                color: MyColors.primaryColor,
                size: 20,
              ),
            )
                : null,
            suffixIcon: _buildSuffixIcon(),
            suffixIconConstraints: BoxConstraints(minWidth: 40),
            suffix: widget.suffix,
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: widget.hintColor ?? MyColors.white,
              fontFamily: 'Cairo',
            ),
            border: widget.border ??
                OutlineInputBorder(
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: _errorMessage != null
                        ? MyColors.appRed
                        : _isFocused
                        ? MyColors.borderColor
                        : MyColors.borderColor,
                    width: 1,
                  ),
                ),
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: _errorMessage != null
                        ? MyColors.appRed
                        : MyColors.borderColor,
                    width: 1,
                  ),
                ),
            focusedBorder: widget.border ??
                OutlineInputBorder(
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: _errorMessage != null
                        ? MyColors.appRed
                        : MyColors.borderColor,
                    width: 1,
                  ),
                ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(color: MyColors.appRed, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              borderSide: BorderSide(color: MyColors.appRed, width: 1.5),
            ),
          ),
          buildCounter: widget.maxLength != null
              ? (
              context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) {
            return MainText(
              '$currentLength/${widget.maxLength}',
              color: currentLength >= widget.maxLength!
                  ? Colors.red
                  : Colors.grey,
              fontFamily: 'Cairo',
            );
          }
              : null,
        ),
      ],
    );
  }
}
