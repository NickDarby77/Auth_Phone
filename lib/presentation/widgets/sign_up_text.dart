import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app_homework/presentation/fonts/app_fonts.dart';

class SignUpTextWidget extends StatelessWidget {
  const SignUpTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Are you a new user? ',
          style: AppFonts.s15w600,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: AppFonts.signUpStyle,
          ),
        ),
      ],
    );
  }
}
