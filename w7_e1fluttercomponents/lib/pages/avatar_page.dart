import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Avatar Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 159, 124, 220),
          actions: [
            //propiedad
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: const Column(
          children: [
            FadeInImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              placeholder: AssetImage("assets/images/loading.gif"),
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 2000),
            )
            // Image.network("https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            // Image.asset("assets/images/loading.gif")
          ],
        ));
  }
}
