import 'dart:developer';

import 'package:fire_app/core/utils/add_note.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:fire_app/core/utils/text_button_widget.dart';
import 'package:fire_app/core/utils/text_field_widget.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody(
      {super.key, required this.docID, required this.noteID});
  final String docID;
  final String noteID;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              TextFieldWidget(
                  textlabel: 'edit note',
                  iconData: Icons.edit,
                  textEditingController: textEditingController),
              const SizedBox(height: 20),
              TextFieldWidget(
                  textlabel: 'add content',
                  iconData: Icons.note,
                  textEditingController: contentController),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextButtonWidget(
                  text: "save",
                  onPressed: () async {
                    log(widget.docID);
                    log(widget.noteID);

                    if (textEditingController.text.isNotEmpty &&
                        contentController.text.isNotEmpty) {
                      setState(() {
                        isloading = true;
                      });
                      await editNote(
                          docID: widget.docID,
                          noteID: widget.noteID,
                          data: {
                            'title': textEditingController.text,
                            'content': contentController.text,
                            'date': DateTime.now(),
                          },
                          context: context);
                      textEditingController.clear();
                      contentController.clear();
                      setState(() {
                        isloading = false;
                      });
                    } else {
                      awesomeDialogCustom(context, 'Error',
                          'Please enter a title', DialogType.error);
                    }
                  },
                ),
              )
            ],
          ),
        ),
        if (isloading)
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
