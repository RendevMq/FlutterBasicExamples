import 'package:flutter/material.dart';
// import 'package:futuresg7/pages/screenB.dart';
import 'package:w7_e1futures/pages/screen_B.dart';

class ScreenA extends StatefulWidget {
  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  TextEditingController _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SCREEN A")),
      body: Center(
        child: Column(
          children: [
            Text("RESULTADO DE LA PANTALLA B"),
            Text(_resultController.text),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScreenB(),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _resultController.text = result;
                  });
                }
              },
              child: Text("IR A SCRENN B"),
            )
          ],
        ),
      ),
    );
  }
}