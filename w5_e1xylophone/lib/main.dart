import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget spaceNote(int note , Color color) {
    return Expanded(
      child: Container(
        color: color,
        // width: double.infinity,
        child: TextButton(
          onPressed: () {
            playNote(note);
          },
          child: const Text(""),
        ),
      ),
    );
  }

  void playNote(int note ) {
    AudioPlayer mandarina =
        AudioPlayer(); //instancia que nos ayudara a ejecutar el audio
    //mandarina.play(); Para llegar a AssetsSoource tengo que con CtrlCLick recorrer la libreria y se llega al AssetSource..primero soliocita un Source, pero al ser un abstract se busca uno que lo extiende y asi se llega al AssetSource..
    mandarina.play(AssetSource(
        "audios/note$note.wav")); //la referencia ya esta en los "assets" -> por eso comienza de audios/...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Xylophone",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          spaceNote(1 , Colors.red),
          spaceNote(2 , Colors.blue),
          spaceNote(3 , Colors.green),
          spaceNote(4 , Colors.black38),
          spaceNote(5 , Colors.pink),
          spaceNote(6 , Colors.purple),
          spaceNote(7 , Colors.yellow),
        ],
      ),
    );
  }
}
