import 'package:flutter/material.dart';

import '../model/dynamic_form_model.dart';

class DynamicDateRange extends StatefulWidget {
  final DynamicFormModel data;
  const DynamicDateRange({super.key,required this.data});

  @override
  State<DynamicDateRange> createState() => _DynamicDateRangeState();
}

class _DynamicDateRangeState extends State<DynamicDateRange> {

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fromController.text = "cc";
    toController.text = "dd";
  }


  _onDateRangePick() async{
    final pickedDate = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(9001),
    );
    if(pickedDate != null){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
              readOnly: widget.data.textFieldModel?.isReadOnly ?? false,
              onTap: _onDateRangePick,
              validator: widget.data.textFieldModel?.validator,
              inputFormatters: widget.data.textFieldModel?.inputFormatter,
              autovalidateMode: widget.data.textFieldModel?.autovalidateMode,
              controller: fromController,
              onChanged: (updateData)=>widget.data.value=updateData,
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
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
              readOnly: widget.data.textFieldModel?.isReadOnly ?? false,
              onTap:_onDateRangePick,
              validator: widget.data.textFieldModel?.validator,
              inputFormatters: widget.data.textFieldModel?.inputFormatter,
              autovalidateMode: widget.data.textFieldModel?.autovalidateMode,
              controller: toController,
              onChanged: (updateData)=>widget.data.value=updateData,
            ),
          ),
        ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    fromController.dispose();
    toController.dispose();
  }
}
