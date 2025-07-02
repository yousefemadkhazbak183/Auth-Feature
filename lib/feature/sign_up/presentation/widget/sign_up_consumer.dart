import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/core/widgets/app_text_button.dart';
import 'package:auth_feature/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:auth_feature/feature/sign_up/presentation/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';

class SignUpConsumer extends StatelessWidget {
  const SignUpConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUPErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SignUpSuccessState) {
            Navigator.pushNamed(context, Routers.homeRouter);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Text('Create Account', style: AppStyles.font20Blue),
              SizedBox(height: 40.h),
              Column(
                children: [
                  const SignUpForm(),
                  SizedBox(height: 22.h),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: AppStyles.elevatedButtonStyle,
                        onPressed: () {
                          context.read<SignUpCubit>().signUp(context);
                        },
                        child: const Text('Register'),
                      );
                    },
                  ),
                  SizedBox(height: 22.h),
                  AppTextButton(
                    text: 'Or Login',
                    textStyle: AppStyles.font14Blue,

                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routers.signInRouter);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
