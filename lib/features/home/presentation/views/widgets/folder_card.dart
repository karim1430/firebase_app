import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  const FolderCard({
    super.key,
    this.onTap,
    required this.title,
    this.onlongPress,
  });
  final void Function()? onTap;
  final String title;
  final void Function()? onlongPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: InkWell(
        onLongPress: onlongPress,
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.folder, size: 50, color: Colors.yellow),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
