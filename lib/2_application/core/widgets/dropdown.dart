// ignore_for_file: must_be_immutable

import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatefulWidget {
  String? placeholder;
  String? label;
  SingleValueDropDownController? controller;
  ValueChanged<dynamic>? onChanged;
  EdgeInsetsGeometry? contentPadding;
  InputDecoration? decoration;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Decoration? containerDecoration;
  int dropDownItemCount;
  FormFieldValidator<String>? validator;
  String? errorText;
  List<DropDownValueModel> items;
  String? helperText;
  Color? fillColor;
  TextStyle? labelStyle;
  bool? enableSearch;
  String? titleLabel;

  CustomDropdown({
    super.key,
    this.placeholder,
    this.label = "",
    this.controller,
    this.onChanged,
    this.contentPadding,
    this.decoration,
    this.suffixIcon,
    this.containerDecoration,
    this.prefixIcon,
    required this.dropDownItemCount,
    this.validator,
    this.errorText,
    required this.items,
    this.helperText,
    this.fillColor,
    this.labelStyle,
    this.enableSearch,
    this.titleLabel,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var fontService = FontService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleLabel ?? '',
          style: widget.labelStyle ??
              GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: color.secondary,
              ),
        ),
        Material(
          color: widget.fillColor ?? Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          child: DropDownTextField(
            dropDownIconProperty: IconProperty(
                icon: FontAwesomeIcons.caretDown, color: color.onPrimary),
            clearIconProperty:
                IconProperty(icon: Icons.clear, color: color.onPrimary),
            searchTextStyle:
                fontService.s16w400(context).copyWith(color: color.primary),
            searchDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: const Text('search here'),
              labelStyle: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: color.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color.primary,
                  width: 1.0,
                ),
              ),
              isDense: true,
            ),
            enableSearch: widget.enableSearch ?? false,
            listTextStyle:
                FontService().s14w400(context).copyWith(color: color.secondary),
            textStyle: FontService().s14w400(context),
            textFieldDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(
                widget.label ?? '',
                style: fontService.s14w400(context),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: color.surface,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color.surface,
                  width: 1.0,
                ),
              ),
              isDense: true,
            ),
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: widget.onChanged,
            dropDownList: widget.items.map((valueItem) {
              return DropDownValueModel(
                value: valueItem.value,
                name: valueItem.name,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
