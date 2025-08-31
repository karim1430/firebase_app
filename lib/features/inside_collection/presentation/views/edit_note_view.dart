import 'package:flutter/material.dart';

import 'widget/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.docID, required this.noteID});
  final String docID;
  final String noteID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
        ),
        body: EditNoteViewBody(
          docID: docID,
          noteID: noteID,
        ));
  }
}
