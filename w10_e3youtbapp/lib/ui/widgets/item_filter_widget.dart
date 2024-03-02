import 'package:flutter/material.dart';
import 'package:w10_e3youtbapp/ui/general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  // ItemFilterWidget({super.key});

  String text;
  bool isSelected;
  ItemFilterWidget({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Chip(
        backgroundColor: isSelected ? Colors.white : kBrandSecondaryColor,
        label: Text(text),
        labelStyle:
            TextStyle(color: isSelected ? kBrandPrimaryColor : Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
