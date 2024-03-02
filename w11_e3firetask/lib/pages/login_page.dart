import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w11_e3firetask/general/colors.dart';
import 'package:w11_e3firetask/pages/register_page.dart';
import 'package:w11_e3firetask/widgets/button_custom_widget.dart';
import 'package:w11_e3firetask/widgets/button_normal_widget.dart';
import 'package:w11_e3firetask/widgets/general_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_normal_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              divider30(),

              SvgPicture.asset(
                'assets/images/login.svg',
                height: 180.0,
              ), // SvgPicture.asset

              divider30(),

              Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor,
                ), // TextStyle
              ), // Text
              divider10(),
              divider6(),
              TextFieldNormalWidget(
                hintText:
                    "Correo electrónico", // Agregué una coma que faltaba aquí
                icon: Icons.email,
                controller: _emailController,
              ),
              divider10(),
              TextFieldPasswordWidget(
                controller: _passwordController,
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Iniciar Sesión",
                icon: "check",
                color: kBrandPrimaryColor,
              ),
              divider20(),
              Text("O ingresa con tus redes sociales"),
              divider20(),
              ButtonCustomWidget(
                text: "Iniciar con Google",
                icon: "google",
                color: Color(0xfff84b2a),
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Iniciar con Facebook",
                icon: "facebook",
                color: Color(0xff507cc0),
              ),
              divider10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aún no estas registrado? ",
                  ),
                  divider10Width(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text("Regístrate",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kBrandPrimaryColor)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
