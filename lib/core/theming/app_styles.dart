import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle font16BlueBold = TextStyle(
    fontSize: 16.sp.sp,
    color: Colors.grey,
  );

  static TextStyle font20Blue = TextStyle(
    color: Colors.blue,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14Blue = TextStyle(color: Colors.blue, fontSize: 14.sp);

  static TextStyle font16White = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
  );

  static TextStyle font14White = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
  );

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
  static ButtonStyle elevatedButtonStyleFixedSize = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    minimumSize: Size(double.infinity, 40.h),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );

  static ButtonStyle elevatedButtonStyleSendEmail = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10),
    minimumSize: Size(double.infinity, 40.h),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
