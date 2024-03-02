import 'package:flutter/material.dart';
import 'package:w10_e1movieapp/ui/general/colors.dart';

class LineWidget extends StatelessWidget {
  // const LineWidget({super.key});
  double width;
  LineWidget({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 3.2,
      decoration: BoxDecoration(
          color: kBransSecondaryColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
