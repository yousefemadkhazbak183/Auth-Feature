import 'package:auth_feature/core/widgets/custom_text_form_field.dart';
import 'package:auth_feature/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;

  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignUpCubit>().firstNameController,
            hintText: 'First name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a name';
              }
              return null;
            },
          ),
          SizedBox(height: 18.h),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().lastNameController,
            hintText: 'Last name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a Last name';
              }
              return null;
            },
          ),
          SizedBox(height: 18.h),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter a Valid Email';
              }
              return null;
            },
          ),
          SizedBox(height: 18.h),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },

            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().confirmPasswordController,
            hintText: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Confirm Password';
              }
              if (value !=
                  context.read<SignUpCubit>().passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },

            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
