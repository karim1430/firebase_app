import 'package:fire_app/core/utils/add_note.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:fire_app/core/utils/text_button_widget.dart';
import 'package:fire_app/core/utils/text_field_widget.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key, required this.docID});
  final String docID;
  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
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
                  textlabel: 'add note',
                  iconData: Icons.note,
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
                  text: "add",
                  onPressed: () async {
                    if (textEditingController.text.isNotEmpty &&
                        contentController.text.isNotEmpty) {
                      setState(() {
                        isloading = true;
                      });
                      await addNote(
                          docID: widget.docID,
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
