import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:fire_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

Future<void> addNote({
  required String docID,
  required Map<String, dynamic> data,
  required BuildContext context,
}) async {
  data = {
    'title': data['title'],
    'content': data['content'],
    'date': DateTime.now(),
  };
  FirebaseFirestore.instance
      .collection('categories')
      .doc(docID)
      .collection('karim')
      .add(data)
      .then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('note Added'),
        duration: Duration(seconds: 2),
      ),
    );
    context.pushReplacementNamed(Routes.insideCollectionView, arguments: docID);
  }).catchError((error) {
    log(error.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to add note'),
        duration: Duration(seconds: 2),
      ),
    );
  });
}
