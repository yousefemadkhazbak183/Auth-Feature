import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/core/widgets/app_text_button.dart';
import 'package:auth_feature/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:auth_feature/feature/sign_up/presentation/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              Navigator.pushReplacementNamed(context, Routers.signInRouter);
            }
          },
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SignUPErrorState) {
                return Center(child: Text(state.error));
              }

              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                children: [
                  const SignUpForm(),
                  SizedBox(height: 18.h),
                  ElevatedButton(
                    style: AppStyles.elevatedButtonStyle,
                    onPressed: state is SignUpLoadingState
                        ? null
                        : () {
                            if (context
                                    .read<SignUpCubit>()
                                    .formKey
                                    .currentState
                                    ?.validate() ==
                                true) {
                              context.read<SignUpCubit>().signUp(
                                email: context
                                    .read<SignUpCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<SignUpCubit>()
                                    .passwordController
                                    .text,
                              );
                            }
                          },
                    child: const Text('Register'),
                  ),
                  SizedBox(height: 10.h),
                  AppTextButton(
                    text: 'OR Sign In',
                    textStyle: AppStyles.font14Blue,
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.signInRouter);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
