import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final TextInputType? keyboardType;
  final double? width;
  final double? radius;
  final int? maxLength;
  final int? maxLines;
  final double? margin;
  final bool? isEnable;
  final Function? validator;
  final Function? onSaved;
  final Function? onChanged;
  final bool? isPassword;
  final Color? fillColor;
  final Function? onTap;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final String? initialValue;
  final TextDirection? textDirection;

  const TextFormFieldWidget({
    super.key,
    required this.hint,
    this.label,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.width,
    this.radius,
    this.maxLength,
    this.maxLines,
    this.margin,
    this.isEnable = true,
    this.isPassword,
    this.fillColor,
    this.onTap,
    this.textInputFormatters,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.textDirection,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _focusNode;

  bool isFocused = false;
  bool isPass = false;

  _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();

    isPass = widget.isPassword ?? false;

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_onFocusChange);

    _textEditingController.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin ?? 16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.label ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            _buildTextInput(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInput(BuildContext context) {
    final isParaghraph =
        (widget.maxLines != null) ? widget.maxLines! >= 10 : false;

    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        controller: widget.controller ?? _textEditingController,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.textInputFormatters,
        maxLength: widget.maxLength,
        maxLines: isPass ? 1 : widget.maxLines,
        textDirection: widget.textDirection ?? TextDirection.ltr,
        enabled: widget.isEnable ?? true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) =>
            widget.validator != null ? widget.validator!(value) : null,
        onSaved: (String? value) =>
            widget.onSaved != null ? widget.onSaved!(value) : null,
        onChanged: (String value) =>
            widget.onChanged != null ? widget.onChanged!(value) : null,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorNeutral.darkestGrey,
            ),
        obscureText: isPass,
        cursorHeight: 24,
        cursorWidth: 1.6,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          counterText: isParaghraph ? '0/600' : '',
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ColorNeutral.lightGrey,
              height: widget.maxLines != null ? 1.5 : 1),
          labelText: isParaghraph ? null : widget.hint,
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ColorNeutral.lightGrey,
              ),
          filled: true,
          fillColor:
              widget.fillColor ?? ColorNeutral.lightestGrey.withOpacity(0.2),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorNeutral.lightestGrey.withOpacity(0.8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              widget.radius ?? 6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.radius ?? 6,
            ),
            borderSide: BorderSide(
              color: ColorNeutral.lightestGrey.withOpacity(0.8),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.radius ?? 6,
            ),
            borderSide: const BorderSide(
              color: ColorNeutral.darkGrey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.radius ?? 6,
            ),
          ),
          prefixIcon: widget.textDirection == null ? _getSuffix() : null,
          suffixIcon: isParaghraph
              ? null
              : widget.textDirection == TextDirection.rtl
                  ? _getSuffix()
                  : null,
        ),
      ),
    );
  }

  Widget? _getSuffix() {
    if (widget.isPassword ?? false) {
      return InkWell(
        onTap: () {
          setState(() {
            isPass = !isPass;
          });
        },
        child: isPass
            ? const Icon(
                Icons.visibility_off,
                color: ColorNeutral.lightGrey,
                size: 18,
              )
            : const Icon(
                Icons.visibility,
                color: ColorNeutral.lightGrey,
                size: 18,
              ),
      );
    } else if (_focusNode.hasFocus) {
      return InkWell(
        onTap: () {
          widget.controller != null
              ? widget.controller?.clear()
              : _textEditingController.clear();
          _focusNode.unfocus();
        },
        child: const Icon(
          Icons.close,
          color: ColorNeutral.lightGrey,
          size: 18,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    widget.controller != null
        ? widget.controller?.dispose()
        : _textEditingController.dispose();
  }
}
