import 'package:flutter/material.dart';
import 'widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.title, required this.id});
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit View'),
      ),
      body: EditViewBody(
        title: title,
        id: id,
      ),
    );
  }
}
