import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  const ItemCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 40,
            backgroundImage: NetworkImage(
                "https://hips.hearstapps.com/hmg-prod/images/actor-robert-pattinson-attends-the-opening-ceremony-of-the-news-photo-1588147075.jpg?crop=1.00xw:0.669xh;0,0.0920xh&resize=2048:*"),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "Daniel Valencia Vawkdjawkd",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            "Actor de reparto",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
