import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.textlabel,
    required this.iconData,
    required this.textEditingController,
    this.validator,
    this.keyboardType,
  });
  final String textlabel;
  final IconData iconData;
  final TextEditingController textEditingController;
  final String Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: textEditingController,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $textlabel';
            }
            return null;
          },
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
