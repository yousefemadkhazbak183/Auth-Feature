import 'package:auth_feature/core/widgets/custom_text_form_field.dart';
import 'package:auth_feature/feature/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/app_regex.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<ForgetPasswordCubit>().emailController,
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
        ],
      ),
    );
  }
}
