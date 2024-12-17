import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'field_type.dart';

class DynamicFormModel{
  final String keyName;
  final FormFieldType type;
  dynamic value;
  final String dateFormat;
  final double paddingBottom;
  final TextFieldModel? textFieldModel;
  final ValueChanged<String>? onData;
  final int flex;
  final Widget widget;


  DynamicFormModel({
    required this.keyName,
    required this.type,
    this.textFieldModel,
    this.value,
    this.dateFormat="dd-MM-yyyy",
    this.paddingBottom=8,
    this.flex=1,
    this.onData,
    this.widget=const SizedBox.shrink(),
});
}

class TextFieldModel{
  ///decoration
  final InputDecoration? inputDecoration;
  final bool isRequiredField;
  final String labelText;
  final String hintText;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  ///others
  final TextInputType textInputType;
  final AutovalidateMode autovalidateMode;
  final Function()? onTap;
  final List<TextInputFormatter> inputFormatter;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final FloatingLabelBehavior floatingLabelBehavior;

  TextFieldModel({
    this.inputDecoration,
    this.isRequiredField = false,
    this.labelTextStyle,
    this.hintTextStyle,
    this.fillColor = Colors.transparent,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText="",
    this.hintText="Hint Text",
    this.textInputType = TextInputType.text,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onTap,
    this.inputFormatter=const [],
    this.validator,
    this.isReadOnly=false,
    this.floatingLabelBehavior=FloatingLabelBehavior.always
});
}