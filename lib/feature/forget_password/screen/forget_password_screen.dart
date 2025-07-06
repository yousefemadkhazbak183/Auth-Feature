import 'package:auth_feature/feature/forget_password/cubit/forget_password_cubit.dart';
import 'package:auth_feature/feature/forget_password/widget/forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Success, Please Check your email',
                    style: AppStyles.font14Blue,
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              if (state is ForgetPasswordLoading) {
                const Center(child: CircularProgressIndicator());
              } else if (state is ForgetPasswordError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.toString())));
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ForgetPasswordForm(),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      style: AppStyles.elevatedButtonStyle,
                      onPressed: state is ForgetPasswordLoading
                          ? null
                          : () {
                              if (context
                                      .read<ForgetPasswordCubit>()
                                      .formKey
                                      .currentState
                                      ?.validate() ==
                                  true) {
                                context
                                    .read<ForgetPasswordCubit>()
                                    .passwordReset(
                                      email: context
                                          .read<ForgetPasswordCubit>()
                                          .emailController
                                          .text,
                                    );
                              }
                            },
                      child: const Text('Send Email'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
