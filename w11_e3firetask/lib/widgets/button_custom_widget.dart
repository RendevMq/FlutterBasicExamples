import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w11_e3firetask/general/colors.dart';

class ButtonCustomWidget extends StatelessWidget {
  // const ButtonCustomWidget({super.key});

  String text;
  Color color;
  String icon;
  ButtonCustomWidget(
      {required this.text, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: SvgPicture.asset(
          'assets/icons/$icon.svg',
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        label: Text(
          text,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
