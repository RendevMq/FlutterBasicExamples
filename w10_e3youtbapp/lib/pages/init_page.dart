import 'package:flutter/material.dart';
import 'package:w10_e3youtbapp/pages/home_page.dart';
import 'package:w10_e3youtbapp/ui/general/colors.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    Center(child: Text("Shorts")),
    Center(child: Text("Agregar")),
    Center(child: Text("Suscripcion")),
    Center(child: Text("Biblioteca")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBrandPrimaryColor,
        title: Image.asset(
          'assets/images/logo.png',
          height: 20,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.cast,
                color: Colors.white,
                size: 20,
              )),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
              Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 23,
            ),
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFF0000),
                ),
                child: Text("9+",style: TextStyle(color: Colors.white,fontSize: 11),),
              ),
            )
            ],),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              )),
          const SizedBox(
            width: 6,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 14,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg"),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed, //para tener mas de 3 items
        currentIndex:
            _currentIndex, //selecciona el item segun su indice de iz a der (0 por defecto )
        onTap: (int value) {
          //value es el indice del item
          _currentIndex = value;
          print(value);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_arrow_rounded,
            ),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 4),
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_rounded,
            ),
            label: 'Suscripciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection_rounded,
            ),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
