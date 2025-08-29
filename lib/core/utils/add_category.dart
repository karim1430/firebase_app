import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';

Future<void> addCategory(String title, BuildContext context) {
  // Call the user's CollectionReference to add a new user
  return FirebaseFirestore.instance
      .collection('categories')
      .add(createCategory(title, FirebaseAuth.instance.currentUser!.uid))
      .then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Category Added'),
        duration: Duration(seconds: 2),
      ),
    );
    context.pushNamed(Routes.homeView);
  }).catchError((error) {
    log(error.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to add category'),
        duration: Duration(seconds: 2),
      ),
    );
  });
}

Map<String, dynamic> createCategory(String title, String id) {
  return {
    'title': title,
    'id': id,
  };
}

Future<void> EditCategory(String title, String id, BuildContext context) {
  // Call the user's CollectionReference to add a new user
  return FirebaseFirestore.instance
      .collection('categories')
      .doc(id)
      .update({'title': title}).then((value) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Category Edited'),
        duration: Duration(seconds: 2),
      ),
    );
    context.pushNamed(Routes.homeView);
  }).catchError((error) {
    log(error.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to edit category'),
        duration: Duration(seconds: 2),
      ),
    );
  });
}
