import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/core/theming/app_styles.dart';
import 'package:auth_feature/feature/forget_password/cubit/forget_password_cubit.dart';
import 'package:auth_feature/feature/forget_password/widget/forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/forget_password_state.dart';

class ForgetPasswordConsumer extends StatelessWidget {
  const ForgetPasswordConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email sent, Check your Email')),
            );
            Navigator.pushNamed(context, Routers.signInRouter);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
            child: Column(
              children: [
                Text(
                  'Enter your email for reset password!',
                  style: AppStyles.font14Blue,
                ),
                SizedBox(height: 20.h),
                ForgetPasswordForm(),
                SizedBox(height: 20.h),
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: AppStyles.elevatedButtonStyle,
                      onPressed: () {
                        context.read<ForgetPasswordCubit>().passwordReset(
                          context,
                        );
                      },
                      child: Text('Send Email'),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
