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
                          desc:
                              'Are you sure you want to delete this category?',
                          btnCancelText: 'remove',
                          btnOkText: 'edit',
                          btnCancelOnPress: () {
                            // FirebaseFirestore.instance
                            //     .collection("categories")
                            //     .doc(folders[index].id)
                            //     .delete();
                            // setState(() {
                            //   folders.removeAt(index);
                            // });
                          },
                          btnOkOnPress: () {
                            // TitleAndId titleAndId = TitleAndId(
                            //     title: folders[index]['title'],
                            //     id: folders[index].id);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) {
                            //       return EditView(
                            //         id: folders[index].id,
                            //         title: folders[index]['title'],
                            //       );
                            //     },
                            //     settings: RouteSettings(arguments: titleAndId)));
                          })
                      .show();
                },
                onTap: () {},
                title: folders[index]['title'],
                isSelected: true,
              );
            },
          );
  }
}
