import 'package:flutter/material.dart';
import 'package:test_form/icons/flutterIcons.dart';

import 'dynamic_form.dart';
import 'model/dynamic_form_model.dart';
import 'model/field_type.dart';

class DynamicFormTest extends StatelessWidget {
   DynamicFormTest({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("dkfjds"),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Map reqData = {};
          if(formKey.currentState!.validate()){
            for(var data in modelData){
              if(data is List<DynamicFormModel>){
                for(var va in data){
                  reqData[va.keyName]=va.value;
                }
              }else{
                print(data.keyName);
                print(data.value);
                reqData[data.keyName]=data.value;
              }
            }
            print(reqData);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        // child: Column(
        //   children: [
        //     Text("Hellow Data"),
        //     Icon(MyFlutterApp.aitwotonesetting,color: Colors.green,),
        //     // Icon(MyFlutterApp.batman,color: Colors.green,),
        //     Icon(Icons.add,semanticLabel: "Hellow",),
        //     Semantics(
        //       child: Text("kdsfkdsk"),
        //       button: true,
        //       enabled: true,
        //       onTap: (){
        //         print("object");
        //       },
        //     )
        //   ],
        // ),
        child: DynamicForm(
          formFields: modelData,
          formKey: formKey,
        ),
      ),
    );
  }
  List<dynamic> modelData = [
    DynamicFormModel(
        keyName: "name",
        type: FormFieldType.textField,
        value: "",
        onData: (value){
          print("Hellow $value");
        },
        textFieldModel: TextFieldModel(
          labelText: "First Label",
          isRequiredField: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value)=>value!.length < 5 ? "Sorry wrong input" : null
        )
    ),
    DynamicFormModel(
        keyName: "next",
        type: FormFieldType.textField,
        value: "",
        textFieldModel: TextFieldModel(
            labelText: "First Label",
            isRequiredField: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value)=>value!.isEmpty ? "Sorry wrong input" : null
        )
    ),
    [
      DynamicFormModel(
          keyName: "seconder",
          type: FormFieldType.textField,
          value: "dfdse",
          flex: 50,
          textFieldModel: TextFieldModel(
              labelText: "Second Label",
              isRequiredField: false,
              isReadOnly: false,
              fillColor: Colors.transparent
          )
      ),
    ],
    [
      DynamicFormModel(
          keyName: "second",
          type: FormFieldType.textField,
          value: "dfdse",
          flex: 50,
          textFieldModel: TextFieldModel(
              labelText: "Second Label",
              isRequiredField: false,
              isReadOnly: false,
              fillColor: Colors.transparent
          )
      ),
      DynamicFormModel(
          keyName: "terimi",
          flex: 20,
          type: FormFieldType.custom,
          value: "",
          textFieldModel: TextFieldModel(
              labelText: "Second Label",
              isRequiredField: false,
              isReadOnly: true,
              fillColor: Colors.black12
          ),
          widget: ElevatedButton(onPressed: (){},child: Text("Hellow"),)
      ),
    ],
    DynamicFormModel(
        keyName: "third",
        type: FormFieldType.date,
        value: "34",
        textFieldModel: TextFieldModel(
          labelText: "Second Label",
          isRequiredField: true,
          isReadOnly: true,
          validator: (value)=>value!.isEmpty ? "Provide valide date" : null
        )
    ),
    // DynamicFormModel(
    //     keyName: "four",
    //     type: FormFieldType.dateRange,
    //     value: "",
    //     paddingBottom: 45,
    //     textFieldModel: TextFieldModel(
    //       labelText: "Second Label",
    //       isRequiredField: true,
    //       isReadOnly: true,
    //       validator: (value)=>value!.isEmpty ? "Provide valide date" : null
    //     )
    // ),
    DynamicFormModel(
        keyName: "text",
        type: FormFieldType.custom,
        paddingBottom: 12,
        widget: Text("This is Text widget")),
  ];
}
