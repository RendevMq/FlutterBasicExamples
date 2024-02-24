import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  // const ItemTypeWidget({super.key});

  String text;

  ItemTypeWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, top: 4,right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.07),
              offset: const Offset(4, 4),
              blurRadius: 12)
        ],
      ),
      child: Text(text),
    );
  }
}
