import 'package:flutter/material.dart';
import 'package:w8_e3sharedpreff/pages/my_profile_page.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/1145720/pexels-photo-1145720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white12,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/713520/pexels-photo-713520.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    radius: 30,
                  ),
                  Text(
                    "Alexander Saveedra",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Administrador",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfilePage()));
            },
            title: Text("Mi Perfil"),
            leading: Icon(
              Icons.people,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          ListTile(
            title: Text("Portafolio"),
            leading: Icon(
              Icons.file_copy,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          ListTile(
            title: Text("Cambiar contraseña"),
            leading: Icon(
              Icons.lock,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Divider(
            indent: 12,
            endIndent: 12,
          ),
          ListTile(
            title: Text("Salir"),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
