import 'package:cloud_firestore/cloud_firestore.dart';

class GetOfFirebase {
  getDataOfCategories() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot category = await firestore.collection("categories").get();
    return category.docs;
  }
}
