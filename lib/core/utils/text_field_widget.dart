import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.textlabel,
    required this.iconData,
  });
  final String textlabel;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        labelText: textlabel,
        prefixIcon: Icon(iconData),
      ),
    );
  }
}
