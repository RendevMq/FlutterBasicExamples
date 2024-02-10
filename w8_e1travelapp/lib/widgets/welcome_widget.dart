import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:w8_e1travelapp/pages/home_page.dart';


class WelcomeWidget extends StatelessWidget {
  String title;
  String description;
  Color color;
  String pathAsset;
  bool showButton;

  WelcomeWidget({
    required this.title,
    required this.description,
    required this.color,
    required this.pathAsset,
    required this.showButton,
  });

  Future<void> setYaInicio() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance(); //espera hasta que se instancie el _prefs..luego ya se setea el bool
    _prefs.setBool("yaInicio", true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              pathAsset,
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            showButton
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(),
                        ),
                      );
                      setYaInicio();
                    },
                    child: Text("Vamos!!!"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}