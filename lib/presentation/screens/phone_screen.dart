import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app_homework/presentation/fonts/app_fonts.dart';
import 'package:flutter_phone_auth_app_homework/presentation/widgets/big_circle.dart';
import 'package:flutter_phone_auth_app_homework/presentation/widgets/one_custom_button.dart';
import 'package:flutter_phone_auth_app_homework/presentation/widgets/sign_up_text.dart';
import 'package:flutter_phone_auth_app_homework/presentation/widgets/small_circle.dart';
import 'package:flutter_phone_auth_app_homework/presentation/widgets/text_field.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerPhone = TextEditingController();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF00F4),
              Color(0xFF00FFFF),
            ],
          ),
        ),
        child: Stack(
          children: [
            const SmallCircleWidget(),
            const BigCircleWidget(),
            Transform(
              transform: Matrix4.identity()..translate(0.0, 200.0),
              child: Container(
                width: 428,
                height: 510,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.17),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 23),
                    const Text(
                      'Welcome',
                      style: AppFonts.s25w600,
                    ),
                    const SizedBox(height: 120),
                    TextFieldWidget(
                      controller: controllerPhone,
                      hintText: 'Phone',
                    ),
                    const SizedBox(height: 95),
                    CustomButtonWidgetOne(controller: controllerPhone),
                    const SizedBox(height: 80),
                    const SignUpTextWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
