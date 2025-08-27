import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/core/utils/get_of_firebase.dart';
import 'package:flutter/material.dart';
import 'folder_card.dart';

class HomeVeiwBody extends StatefulWidget {
  const HomeVeiwBody({super.key});

  @override
  State<HomeVeiwBody> createState() => _HomeVeiwBodyState();
}

class _HomeVeiwBodyState extends State<HomeVeiwBody> {
  List<QueryDocumentSnapshot> folders = [];
  getData() async {
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("categories").get();
    folders.addAll(data.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: folders.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return FolderCard(
          onTap: () {},
          title: folders[index]['title'],
        );
      },
    );
  }
}
