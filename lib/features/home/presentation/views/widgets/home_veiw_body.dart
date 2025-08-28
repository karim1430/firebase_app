import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/core/utils/awesome_dialog_custom.dart';
import 'package:flutter/material.dart';
import 'folder_card.dart';

class HomeVeiwBody extends StatefulWidget {
  const HomeVeiwBody({super.key});

  @override
  State<HomeVeiwBody> createState() => _HomeVeiwBodyState();
}

class _HomeVeiwBodyState extends State<HomeVeiwBody> {
  List<QueryDocumentSnapshot> folders = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("categories").get();
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
                onlongPress: () {
                  awesomeDialogCustom(
                      context,
                      'Delete',
                      'Are you sure you want to delete this category?',
                      DialogType.warning, btnOkOnPress: () {
                    FirebaseFirestore.instance
                        .collection("categories")
                        .doc(folders[index].id)
                        .delete();
                    setState(() {
                      folders.removeAt(index);
                    });
                  }).show();
                },
                onTap: () {},
                title: folders[index]['title'],
              );
            },
          );
  }
}
