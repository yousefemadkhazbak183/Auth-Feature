import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/core/widgets/app_text_button.dart';
import 'package:auth_feature/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:auth_feature/feature/sign_in/widget/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              Navigator.pushReplacementNamed(context, Routers.homeRouter);
            }
          },
          child: BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SignInError) {
                return Center(child: Text(state.error));
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SignInForm(),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      style: AppStyles.elevatedButtonStyleFixedSize,
                      onPressed: state is SignInLoading
                          ? null
                          : () {
                              if (context
                                      .read<SignInCubit>()
                                      .formKey
                                      .currentState
                                      ?.validate() ==
                                  true) {
                                context.read<SignInCubit>().signIn(
                                  email: context
                                      .read<SignInCubit>()
                                      .emailNameController
                                      .text,
                                  password: context
                                      .read<SignInCubit>()
                                      .passwordNameController
                                      .text,
                                );
                              }
                            },
                      child: Text('Sign In', style: AppStyles.font14White),
                    ),
                    SizedBox(height: 10.h),
                    AppTextButton(
                      text: 'Forget Password',
                      textStyle: AppStyles.font14Blue,
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(Routers.forgetPasswordRouter);
                      },
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
