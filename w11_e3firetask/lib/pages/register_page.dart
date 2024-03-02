import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w11_e3firetask/general/colors.dart';
import 'package:w11_e3firetask/widgets/button_custom_widget.dart';
import 'package:w11_e3firetask/widgets/general_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_normal_widget.dart';
import 'package:w11_e3firetask/widgets/textfield_password_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              divider30(),
              SvgPicture.asset(
                'assets/images/register.svg',
                height: 180.0,
              ), // SvgPicture.asset

              divider30(),

              Text(
                "Registrate",
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
                    "Nombre Completo", // Agregué una coma que faltaba aquí
                icon: Icons.email,
                controller: _fullNameController,
              ),
              divider10(),
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
                text: "Registrarme ahora",
                icon: "check",
                color: kBrandPrimaryColor,
              ),
              divider20(),
            ],
          ),
        ),
      ),
    );
  }
}
