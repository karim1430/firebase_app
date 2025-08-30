import 'package:fire_app/core/routing/routes.dart';
import 'package:fire_app/features/inside_collection/presentation/views/widget/inside_collection_view_body.dart';
import 'package:flutter/material.dart';

class InsideCollectionView extends StatelessWidget {
  const InsideCollectionView({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inside Collection (Notes)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, Routes.addNoteView, arguments: id);
        },
        child: const Icon(Icons.add),
      ),
      body: InsideCollectionViewBody(
        collectionPath: '',
        id: id,
      ),
    );
  }
}
