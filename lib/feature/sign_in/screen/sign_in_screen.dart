import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/core/widgets/app_text_button.dart';
import 'package:auth_feature/feature/sign_in/widget/sign_in_bloc_consumer.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/app_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignInBlocConsumer(),
            Column(
              children: [
                AppTextButton(
                  text: 'Forget Password',
                  textStyle: AppStyles.font14Blue,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Routers.forgetPasswordRouter);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
