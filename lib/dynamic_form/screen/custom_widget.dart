import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key,required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
