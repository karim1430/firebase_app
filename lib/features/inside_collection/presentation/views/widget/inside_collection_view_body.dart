import 'dart:developer';

import 'package:fire_app/core/extensions/navigation_extensions.dart';
import 'package:fire_app/core/routing/routes.dart';
import 'package:fire_app/features/home/presentation/views/widgets/folder_card.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InsideCollectionViewBody extends StatefulWidget {
  const InsideCollectionViewBody(
      {super.key, required this.collectionPath, required this.id});
  final String collectionPath;
  final String id;
  @override
  State<InsideCollectionViewBody> createState() =>
      _InsideCollectionViewBodyState();
}

class _InsideCollectionViewBodyState extends State<InsideCollectionViewBody> {
  List<QueryDocumentSnapshot> folders = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.id)
        .collection('karim')
        .get();
    folders.addAll(data.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            itemCount: folders.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return FolderCard(
                content: folders[index]['content'],
                createdAt: folders[index]['date'],
                onlongPress: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      title: 'Delete',
                      desc: 'Are you sure you want to delete this category?',
                      btnCancelText: 'remove',
                      btnOkText: 'edit',
                      btnCancelOnPress: () {
                        //delete note
                        removeNote(index, context);
                      },
                      btnOkOnPress: () {
                        context.pushNamed(Routes.editNoteView, arguments: {
                          'docID': widget.id,
                          'noteID': folders[index].id,
                        });
                      }).show();
                },
                onTap: () {},
                title: folders[index]['title'],
                isSelected: true,
              );
            },
          );
  }

  void removeNote(int index, BuildContext context) {
    FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.id)
        .collection('karim')
        .doc(folders[index].id)
        .delete()
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('note Deleted'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        folders.removeAt(index);
      });
    }).catchError((error) {
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete note'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
}
