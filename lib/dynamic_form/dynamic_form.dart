import 'package:flutter/material.dart';
import 'package:test_form/dynamic_form/screen/custom_widget.dart';
import 'package:test_form/dynamic_form/screen/date_field.dart';
import 'package:test_form/dynamic_form/screen/date_range_field.dart';
import 'package:test_form/dynamic_form/screen/text_form_field.dart';

import 'model/dynamic_form_model.dart';
import 'model/field_type.dart';


class DynamicForm extends StatefulWidget {
  final List<dynamic> formFields;
  final GlobalKey<FormState> formKey;
  const DynamicForm({
    super.key,
    required this.formKey,
    required this.formFields
  });

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
          itemCount: widget.formFields.length,
          itemBuilder: (context,index){
            dynamic model = widget.formFields[index];
            if(model is List<DynamicFormModel> && model.isNotEmpty){
              return Padding(
                padding: EdgeInsets.only(bottom: model.first.paddingBottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: model.asMap().entries.map((entry) {
                    return Expanded(
                      flex: entry.value.flex,  // Assuming `flex` is a property in `data`
                      child: Padding(
                        padding: EdgeInsets.only(right: (entry.key == model.length-1) ? 0 : 8),
                          child: _dynamicFormField(entry.value)),
                    );
                  }).toList(),
                ),
              );;
            }
            else if(model is DynamicFormModel){
              return Padding(
                padding: EdgeInsets.only(bottom: model.paddingBottom),
                  child: _dynamicFormField(model));
            }else{
              return const SizedBox.shrink();
            }
          }
      )
    );
  }

  Widget _dynamicFormField(DynamicFormModel model){
    switch(model.type){
      case FormFieldType.textField:
        return DynamicTextFormField(data:model);
      case FormFieldType.date:
        return DynamicDateField(data: model);
      case FormFieldType.dateRange:
        return DynamicDateRange(data: model);
      case FormFieldType.custom:
        return CustomWidget(widget: model.widget);
      default:
        return const SizedBox.shrink();
    }
  }
}
