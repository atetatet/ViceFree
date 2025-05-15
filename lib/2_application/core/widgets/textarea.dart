// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextarea extends StatefulWidget {
  String? placeholder;
  String? label;
  String? sampleText;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  String? hintText;
  String? errorText;
  TextEditingController? controller;
  bool? autoFocus;
  Color? fillColor;
  Color? cursorColor;
  TextStyle? style;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;
  EdgeInsetsGeometry? padding;
  InputDecoration? decoration;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Decoration? containerDecoration;
  TextStyle? labelStyle;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  EdgeInsets? scrollPadding;
  bool? enabled;
  bool? isMultiLine;
  bool? isRequired;
  String? helperText;
  int? minLines;
  int? maxLines;
  Color? borderSideColor;
  Color? focusedBorderSideColor;
  bool? isReadOnly;
  Function()? onTap;

  CustomTextarea({
    super.key,
    this.placeholder,
    this.label = "",
    this.sampleText,
    this.onChanged,
    this.validator,
    this.hintText,
    this.errorText,
    this.controller,
    this.autoFocus,
    this.fillColor,
    this.cursorColor,
    this.style,
    this.hintStyle,
    this.contentPadding,
    this.padding,
    this.decoration,
    this.suffixIcon,
    this.containerDecoration,
    this.prefixIcon,
    this.labelStyle,
    this.keyboardType,
    this.textInputAction,
    this.scrollPadding,
    this.enabled,
    this.isMultiLine,
    this.isRequired,
    this.onTap,
    this.helperText,
    this.minLines,
    this.maxLines,
    this.borderSideColor,
    this.focusedBorderSideColor,
    this.isReadOnly,
  });

  @override
  State<CustomTextarea> createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {
  final _fsKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    return Form(
      key: _fsKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        color: color.surface,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 300.0,
          ),
          child: Padding(
            padding: widget.padding ??
                EdgeInsets.only(
                  bottom: widget.helperText != null ? 20 : 20,
                ),
            child: Material(
              color: widget.fillColor ?? color.primaryContainer,
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                readOnly: widget.isReadOnly ?? false,
                cursorColor: widget.cursorColor ?? Colors.grey[700],
                // style: const TextStyle(color: Colors.white),
                textAlignVertical: TextAlignVertical.top,
                enabled: widget.enabled ?? true,
                initialValue: widget.sampleText,
                autovalidateMode: AutovalidateMode.disabled,
                validator:
                    widget.isRequired != null && widget.isRequired == true
                        ? widget.validator ??
                            (value) {
                              if (value == null || value.isEmpty) {
                                return widget.errorText ??
                                    '${widget.label} is required';
                              }

                              return null;
                            }
                        : null,
                controller: widget.controller,
                autofocus: widget.autoFocus ?? false,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
                onTap: widget.onTap,
                onChanged: widget.onChanged,
                decoration: widget.decoration ??
                    InputDecoration(
                      focusColor: Colors.white,
                      helperText: widget.helperText,
                      helperMaxLines: 10,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: widget.borderSideColor ?? color.surface,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.focusedBorderSideColor ?? color.surface,
                          width: 1.0,
                        ),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                        bottom: 20,
                        left: 10,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      labelText: widget.label ?? "",
                      labelStyle: widget.labelStyle,
                      alignLabelWithHint: true,
                      hintText: widget.hintText ?? "",
                      errorText: widget.errorText,
                      fillColor: color.onSecondaryContainer,
                      suffixIcon: widget.suffixIcon,
                      prefixIcon: widget.prefixIcon == null
                          ? null
                          : SizedBox(
                              width: 60,
                              child: Center(child: widget.prefixIcon),
                            ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
