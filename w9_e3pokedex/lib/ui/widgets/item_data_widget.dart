import 'package:flutter/material.dart';

class ItemDataWidget extends StatelessWidget {
  // const ItemDataWidget({super.key});
  String title;
  String data;

  ItemDataWidget({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          Text(
            data,
          )
        ],
      ),
    );
  }
}
