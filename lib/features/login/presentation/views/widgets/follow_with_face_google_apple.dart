import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowWithFaceGoogleApple extends StatelessWidget {
  const FollowWithFaceGoogleApple({
    super.key,
    required this.iconData,
    required this.color,
  });
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: color, size: 35.r),
          ],
        ),
      ),
    );
  }
}
