import 'package:flutter/material.dart';
import 'package:flutter_phone_auth_app_homework/presentation/fonts/app_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 30,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintStyle: AppFonts.s15w600,
          hintText: hintText,
          suffixIconColor: Colors.cyan,
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(
              Icons.clear,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
