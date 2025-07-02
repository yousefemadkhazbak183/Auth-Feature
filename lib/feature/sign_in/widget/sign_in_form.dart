import 'package:auth_feature/core/widgets/custom_text_form_field.dart';
import 'package:auth_feature/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/app_regex.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignInCubit>().emailNameController,
            hintText: 'email',

            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter a Valid Email';
              }
            },
          ),
          SizedBox(height: 18.h),
          CustomTextFormField(
            controller: context.read<SignInCubit>().passwordNameController,
            hintText: 'password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a password';
              }
            },
          ),
        ],
      ),
    );
  }
}
