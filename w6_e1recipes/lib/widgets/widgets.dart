  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget formulario_input(
      TextEditingController controller, String texto, String imgicon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        //No tiene un validator
        // TextFormField(
        //tiene un Validator
        // validator:
        // inputFormatters: [
          // LengthLimitingTextInputFormatter(35),
          // Opcion 1 : FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: false )
      
          //Opcion 2 (uno de los 2): Tambien se puede hacer así:
          // FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
          // FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        // ],
        keyboardType: TextInputType.name,
        // keyboardType: TextInputType.number,
        // obscureText: true, //el aspecto de Contraseña
      
        style: TextStyle(color: Colors.white),
        cursorColor: Color(0xffEDA971),
        // cursorHeight: 30,
        // cursorWidth: 10,
        // cursorRadius: Radius.circular(10),
      
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          labelStyle: TextStyle(color: Colors.orange),
          hintText: texto,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          filled: true,
          fillColor: Color(0xff616B8F),
          prefixIcon: SvgPicture.asset(
            "assets/icons/$imgicon.svg",
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              Colors.blue,
              BlendMode.srcIn,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
            // borderSide: BorderSide(
            //   color: Colors.black26,
            //   width: 2,
            // ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
      
            // borderSide: BorderSide(
            //   color: Colors.black26,
            //   width: 3,
            // ),
          ),
        ),
      
        //NO ES RECOMENDABLE
        // onChanged: (String value) {
        //   print(value);
        //   title = value;
        //   print("title : $title");
        // },
      
        //NOS AYUDA A CONTROLAR EL ESTADO.. el titel controler va a controolar el valor que le vamoso a asignar al Textfield.. estos controlador deben ser creados o definidos por cada uno de los textfield.. es decir si tengo 4 text editing debo tener 4 de estos controladoores..
        controller: controller,
      ),
    );
  }