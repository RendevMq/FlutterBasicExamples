import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Container Page"),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //HEADER
              Container(
                height: 120,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.3),
                      offset: Offset(9, 9),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: const Text(
                  "I am a header",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 8,
                  ),
                ),
                child: const Text(
                  "H",
                  style: TextStyle(
                    fontSize: 120,
                    color: Colors.orange,
                  ),
                ),
              ),
              //SOLUCION PROFE
              // Container(
              //   padding: EdgeInsets.all(16),
              //   width: 300,
              //   height: 150,
              //   alignment: Alignment.centerLeft,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25),
              //     color: Colors.red,
              //     gradient: LinearGradient(
              //       colors: [
              //         Color(0xffF3C80A),
              //         Color(0xffE36B8F),
              //         Color(0xff82348E),
              //       ],
              //       begin: Alignment.centerLeft,
              //       end: Alignment.centerRight,
              //       stops: [
              //         0.10,
              //         0.40,
              //         0.9,
              //       ],
              //     ),
              //   ),
              //   child: Text(
              //     "Challenge",
              //     style: TextStyle(
              //       fontSize: 45,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w200,
              //       fontStyle: FontStyle.italic,
              //     ),
              //   ),
              // ),

              //MI SOLUCION
              SizedBox(
                height: 100,
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            color: Colors.blue.shade200,
                          ),
                          child: const Center(
                              child: Text(
                            "Challenge",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
          
              //GRADIENTE EN CONTAINER
              Container(
                padding: const EdgeInsets.all(16),
                width: 300,
                height: 150,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffF3C80A),
                      Color(0xffE36B8F),
                      Color(0xff82348E),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.10,
                      0.40,
                      0.9,
                    ],
                  ),
                ),
                child: const Text(
                  "Challenge",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          
              //GRADIENTE A TEXTO FORMA 1
              ShaderMask(
                shaderCallback: ((bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                    stops: [0.0, 1.0],
                  ).createShader(bounds);
                }),
                child: Text(
                  "Texto con gradiente",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              //GRADIENTE A TEXTO FORMA 2
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 35, color: Colors.black),
                  children: [
                    TextSpan(text: "Texto con "),
                    TextSpan(
                      text: "Gradiente 2",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.red,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.blue,
                            ],
                            // stops: [0.2, 0.5],
                          ).createShader(
                            Rect.fromLTRB(20, 20, 20, 20),
                          ),
                      ),
                    ),
                  ],
                ),
              ), // Text(
              //   "Texto con gradiente 2",
              //   style: TextStyle(
              //     fontSize: 35,
              //     fontWeight: FontWeight.bold,
              //     // color: Colors.white,
              //   ),
              // )
              
              //BORDERS EN CONTAINER
              Container(
                margin: EdgeInsets.all(24),
                width: 300,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: Colors.blue, width: 10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          offset: Offset(7, 7),
                          blurRadius: 10)
                    ]),
                child: Text("HOLA"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
