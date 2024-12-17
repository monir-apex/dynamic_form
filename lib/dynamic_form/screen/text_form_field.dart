import 'package:flutter/material.dart';

import '../model/dynamic_form_model.dart';

class DynamicTextFormField extends StatelessWidget {
  final DynamicFormModel data;
  const DynamicTextFormField({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: data.paddingBottom),
      child: TextFormField(
        key: key,
        decoration: data.textFieldModel?.inputDecoration ?? InputDecoration(
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
          hintText: data.textFieldModel?.hintText,
          filled: true,
          hintStyle: data.textFieldModel?.hintTextStyle,
          label: RichText(
            text: TextSpan(
              text: data.textFieldModel?.labelText, // Normal label text
              style: data.textFieldModel?.labelTextStyle ?? const TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
              children: [
                if(data.textFieldModel?.isRequiredField ?? false)
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
          fillColor: data.textFieldModel?.fillColor,
          suffixIcon: data.textFieldModel?.suffixIcon,
          prefixIcon: data.textFieldModel?.prefixIcon,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: data.textFieldModel?.floatingLabelBehavior
        ),
        readOnly: data.textFieldModel?.isReadOnly ?? false,
        validator: data.textFieldModel?.validator,
        inputFormatters: data.textFieldModel?.inputFormatter,
        onTap: data.textFieldModel?.onTap,
        keyboardType: data.textFieldModel?.textInputType,
        autovalidateMode: data.textFieldModel?.autovalidateMode,
        initialValue: data.value,
        onChanged: (updateData){
          data.value=updateData;
          data.onData!(updateData);
        },
      ),
    );
  }
}
