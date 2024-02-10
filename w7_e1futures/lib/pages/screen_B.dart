import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SCREEN B")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Ingresar datos "),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _controller.text);
            },
            child: Text("Enviar Datos"),
          ),
        ],
      ),
    );
  }
}