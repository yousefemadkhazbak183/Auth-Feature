import 'package:auth_feature/feature/forget_password/widget/forget_password_consumer.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForgetPasswordConsumer(),

          ],
        ),
      ),
    );
  }
}
