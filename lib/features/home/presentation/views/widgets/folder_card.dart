import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  const FolderCard({
    super.key,
    this.onTap,
    required this.title,
    this.onlongPress,
    this.isSelected = false,
    this.content,
    this.createdAt,
  });
  final void Function()? onTap;
  final String title;
  final void Function()? onlongPress;
  final bool isSelected;
  final String? content;
  final Timestamp? createdAt;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isSelected
                  ? SizedBox()
                  : Icon(Icons.folder, size: 50, color: Colors.yellow),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              isSelected
                  ? Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          content!,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Created at: ${createdAt != null ? createdAt!.toDate().toString().split('.')[0] : 'N/A'}',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
