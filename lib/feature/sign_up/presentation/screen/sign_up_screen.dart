import 'package:auth_feature/feature/sign_up/presentation/widget/sign_up_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          children: const [SignUpConsumer()],
        ),
      ),
    );
  }
}
