import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';

class TextFieldNormalWidget extends StatelessWidget {
  // const TextFieldNormalWidget({super.key});

  String hintText;
  IconData icon;
  Function? onTapp;
  TextEditingController controller;

  TextFieldNormalWidget(
      {required this.hintText,
      required this.icon,
      this.onTapp,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(4, 4))
        ],
      ),
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty && value != null) {
            return "Campo obligatorio";
          }
          return null;
        },
        controller: controller,
        onTap: onTapp != null
            ? () {
                onTapp!();
              }
            : null,
        readOnly: onTapp != null ? true : false,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          prefixIcon: Icon(
            icon,
            size: 20,
            color: kBrandPrimaryColor.withOpacity(0.6),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: kBrandPrimaryColor.withOpacity(0.6),
          ),
          filled: true,
          fillColor: kBrandSecondaryColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
