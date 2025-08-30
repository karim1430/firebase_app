import 'package:fire_app/features/inside_collection/presentation/views/widget/add_note_view_body.dart';
import 'package:flutter/material.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
    required this.docID,
  });
  final String docID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Note'),
        ),
        body: AddNoteViewBody(
          docID: docID,
        ));
  }
}
