import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  // const TextFieldPasswordWidget({super.key});
  TextEditingController controller;

  TextFieldPasswordWidget({required this.controller});

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool isInvisible = false;

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
        obscureText: isInvisible,
        validator: (String? value) {
          if (value!.isEmpty && value != null) {
            return "Campo obligatorio";
          }
          return null;
        },
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          prefixIcon: Icon(
            Icons.lock,
            size: 20,
            color: kBrandPrimaryColor.withOpacity(0.6),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              isInvisible = !isInvisible;
              setState(() {});
            },
            icon: Icon(
              isInvisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
              color: kBrandPrimaryColor.withOpacity(0.6),
            ),
          ),
          hintText: 'Contraseña',
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
