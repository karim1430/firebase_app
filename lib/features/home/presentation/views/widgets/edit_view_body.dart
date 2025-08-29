import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:fire_app/core/utils/text_button_widget.dart';
import 'package:fire_app/core/utils/text_field_widget.dart';
import '../../../../../core/utils/add_category.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.title, required this.id});
  final String title;
  final String id;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.text = widget.title;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.title);
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          TextFieldWidget(
              textlabel: 'edit note',
              iconData: Icons.note,
              textEditingController: textEditingController),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextButtonWidget(
              text: "edit",
              onPressed: () async {
                if (textEditingController.text.isNotEmpty) {
                  await EditCategory(
                      textEditingController.text, widget.id, context);
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
