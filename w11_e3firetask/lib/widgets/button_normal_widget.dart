import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';

class ButtonNormalWidget extends StatelessWidget {
  // const ButtonNormalWidget({super.key});

  Function onPPressed;

  ButtonNormalWidget({required this.onPPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          onPPressed();
        },
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          "Guardar",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: kBrandPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
      ),
    );
  }
}
