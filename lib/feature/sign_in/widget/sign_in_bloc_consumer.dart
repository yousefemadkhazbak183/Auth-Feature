import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:auth_feature/feature/sign_in/cubit/sign_in_state.dart';
import 'package:auth_feature/feature/sign_in/widget/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_styles.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SignInSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Success')));
            Navigator.of(context).pushReplacementNamed(Routers.homeRouter);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
            child: Column(
              children: [
                Text('Welcome Back', style: AppStyles.font20Blue),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    const SignInForm(),
                    SizedBox(height: 22.h),
                    BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: AppStyles.elevatedButtonStyleFixedSize,
                          onPressed: () {
                            context.read<SignInCubit>().signIn(context);
                          },
                          child: Text('Sign In', style: AppStyles.font14White),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
