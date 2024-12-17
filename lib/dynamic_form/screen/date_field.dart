import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/dynamic_form_model.dart';

class DynamicDateField extends StatefulWidget {
  final DynamicFormModel data;
  const DynamicDateField({super.key,required this.data});

  @override
  State<DynamicDateField> createState() => _DynamicDateFieldState();
}

class _DynamicDateFieldState extends State<DynamicDateField> {

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.data.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.data.paddingBottom),
      child: TextFormField(
        key: widget.key,
        decoration: widget.data.textFieldModel?.inputDecoration ?? InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:const BorderSide(
                    color: Colors.black54,
                    width: 0.6
                )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:const BorderSide(
                    color: Colors.black54,
                    width: 0.6
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:const BorderSide(
                    color: Colors.red,
                    width: 0.6
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:const BorderSide(
                    color: Colors.black54,
                    width: 0.8
                )
            ),
            hintText: widget.data.textFieldModel?.hintText,
            filled: true,
            hintStyle: widget.data.textFieldModel?.hintTextStyle,
            label: RichText(
              text: TextSpan(
                text: widget.data.textFieldModel?.labelText, // Normal label text
                style: widget.data.textFieldModel?.labelTextStyle ?? const TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
                children: [
                  if(widget.data.textFieldModel?.isRequiredField ?? false)
                    const TextSpan(
                      text: '*', // Red asterisk
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                ],
              ),
            ),
            fillColor: widget.data.textFieldModel?.fillColor,
            suffixIcon: widget.data.textFieldModel?.suffixIcon ?? const Icon(Icons.calendar_month),
            prefixIcon: widget.data.textFieldModel?.prefixIcon,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: widget.data.textFieldModel?.floatingLabelBehavior
        ),
        readOnly: true,
        validator: widget.data.textFieldModel?.validator,
        inputFormatters: widget.data.textFieldModel?.inputFormatter,
        onTap: widget.data.textFieldModel?.onTap ?? () async{
          final pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(9001),
          );
          if(pickedDate != null){
            final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
            final inputDate = inputFormat.parse(pickedDate.toString());

            final outputFormat = DateFormat(widget.data.dateFormat);
            final outputDate = outputFormat.format(inputDate);
            widget.data.value = outputDate;
            controller.text = widget.data.value;
          }
        },
        keyboardType: widget.data.textFieldModel?.textInputType,
        autovalidateMode: widget.data.textFieldModel?.autovalidateMode,
        controller: controller,
        onChanged: (updateData){
          widget.data.value=updateData;
          widget.data.onData!(updateData);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
