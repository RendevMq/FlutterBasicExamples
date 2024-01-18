import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int num = 0;
  List<int> listaNum = [0, 0, 0, 0, 0];

  void incrmentar1(int index) {
    listaNum[index]++;
    print(listaNum);
    num++;
  }

  Widget containerContador( String title , int index) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25,
            ),
          ),
          Text(
            listaNum[index].toString(),
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              incrmentar1(index);
              setState(() {});
            },
            child: Text("add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            listaNum = [0, 0, 0, 0, 0];
            num = 0;
            setState(() {});
          },
          backgroundColor: Colors.red,
          child: Text("Reset"),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            //para el horizontal..una alternativa, o se podia hacer con el cross..center en column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num.toString(),
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    containerContador("Contador 1" , 0),
                    containerContador("Contador 2" , 1),
                  ],
                ),
                Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    containerContador("Contador 3" , 2),
                    containerContador("Contador 4" , 3),
                  ],
                ),
                Divider(
                  height: 20,
                ),
                containerContador("Contador 5" , 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}