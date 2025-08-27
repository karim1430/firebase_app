import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:fire_app/core/utils/text_button_widget.dart';
import 'package:fire_app/core/utils/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/add_category.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          TextFieldWidget(
              textlabel: 'add note',
              iconData: Icons.note,
              textEditingController: textEditingController),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextButtonWidget(
              text: "add",
              onPressed: () async {
                if (textEditingController.text.isNotEmpty) {
                  await addCategory(textEditingController.text, context);
                  textEditingController.clear();
                  setState(() {});
                } else {
                  awesomeDialogCustom(context, 'Error', 'Please enter a title',
                      DialogType.error);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
