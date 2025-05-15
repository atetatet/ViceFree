// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformfield extends StatefulWidget {
  String? placeholder;
  String? label;
  bool? isPassword;
  bool obscureText;
  String? sampleText;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  String? hintText;
  String? errorText;
  String? helperText;
  TextEditingController? controller;
  bool? autoFocus;
  int? maxLines;
  Color? fillColor;
  TextStyle? style;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;
  InputDecoration? decoration;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Decoration? containerDecoration;
  TextStyle? labelStyle;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  EdgeInsets? scrollPadding;
  bool? enabled;
  bool? isRequired;
  Color? cursorColor;
  FloatingLabelBehavior? floatingLabelBehavior;
  List<TextInputFormatter>? inputFormatters;
  int? maxLength;
  Function()? onTap;
  bool? showLabelOnTop;
  String? titleLabel;
  bool? isFloatingLabelShow;
  FocusNode? focusNode;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;

  CustomTextformfield({
    super.key,
    this.placeholder,
    this.label = "",
    this.isPassword,
    this.obscureText = false,
    this.sampleText,
    this.onChanged,
    this.validator,
    this.hintText,
    this.errorText,
    this.helperText,
    this.controller,
    this.autoFocus,
    this.maxLines,
    this.fillColor,
    this.style,
    this.hintStyle,
    this.contentPadding,
    this.decoration,
    this.suffixIcon,
    this.containerDecoration,
    this.prefixIcon,
    this.labelStyle,
    this.keyboardType,
    this.textInputAction,
    this.scrollPadding,
    this.enabled,
    this.isRequired,
    this.cursorColor,
    this.floatingLabelBehavior,
    this.onTap,
    this.inputFormatters,
    this.maxLength,
    this.showLabelOnTop,
    this.titleLabel,
    this.isFloatingLabelShow,
    this.focusNode,
    this.enabledBorder,
    this.focusedBorder,
  });

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  final _fsKey = GlobalKey<FormState>();

  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.isPassword ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    bool isPassword = widget.isPassword ?? false;
    bool showLabelOnTop = widget.showLabelOnTop ?? false;
    var maxLines = widget.maxLines ?? 1;
    bool isFloatingLabelShow = widget.isFloatingLabelShow ?? false;

    return Form(
      key: _fsKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isFloatingLabelShow
              ? Text(
                  widget.label ?? '',
                  style: widget.labelStyle ??
                      GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: theme.onPrimary,
                      ),
                )
              : const EmptyWidget(),
          SizedboxService.h5,
          showLabelOnTop
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.titleLabel ?? ''),
                    SizedboxService.h10,
                    _widgetTextFormField(theme, isPassword, context),
                  ],
                )
              : _widgetTextFormField(theme, isPassword, context),
          SizedboxService.h10,
        ],
      ),
    );
  }

  Material _widgetTextFormField(
      ColorScheme theme, bool isPassword, BuildContext context) {
    return Material(
      color: widget.fillColor ?? theme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        cursorColor: widget.cursorColor ?? Colors.grey[700],
        style: widget.enabled == false
            ? const TextStyle(
                color: Colors.black87,
              )
            : null,
        textAlignVertical: TextAlignVertical.center,
        enabled: widget.enabled ?? true,
        obscureText: _obscureText,
        initialValue: widget.sampleText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.isRequired != null && widget.isRequired == true
            ? widget.validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return widget.errorText ?? '${widget.label} is required';
                  }

                  return null;
                }
            : null,
        controller: widget.controller,
        autofocus: widget.autoFocus ?? false,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        decoration: widget.decoration ??
            InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              floatingLabelBehavior:
                  widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              label: Text(widget.label ?? ''),
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: theme.primaryContainer,
                    ),
                  ),
              focusedBorder: widget.focusedBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.primaryContainer,
                      width: 1.0,
                    ),
                  ),
              isDense: true,
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 14,
                        ),
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 20,
                        ),
                      ),
                    )
                  : widget.suffixIcon,
              prefixIcon: isPassword
                  ? const SizedBox(
                      width: 60,
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.lock,
                        size: 15,
                      )),
                    )
                  : widget.prefixIcon == null
                      ? null
                      : SizedBox(
                          width: 60,
                          child: Center(child: widget.prefixIcon),
                        ),
            ),
      ),
    );
  }
}
