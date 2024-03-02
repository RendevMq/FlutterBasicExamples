import 'package:flutter/material.dart';
import 'package:w11_e3firetask/general/colors.dart';

class ItemCategoryWidget extends StatelessWidget {
  // const ItemCategoryWidget({super.key});
  String text;

  ItemCategoryWidget({required this.text});

  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: categoryColor[text],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
