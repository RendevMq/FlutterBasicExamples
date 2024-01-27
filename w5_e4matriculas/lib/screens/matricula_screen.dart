import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:w5_e2matriculas/models/carrera_model.dart';
import 'package:w5_e2matriculas/models/institucion_model.dart';
import 'package:w5_e2matriculas/models/matricula_model.dart';
import 'package:w5_e2matriculas/models/person_model.dart';

class MatriculasHome extends StatefulWidget {
  @override
  State<MatriculasHome> createState() => _MatriculasHomeState();
}

class _MatriculasHomeState extends State<MatriculasHome> {
  List<Person> peopleList = [
    Person(name: "Ana", address: "av 1245", phone: "12345679"),
    Person(name: "Lia", address: "av lima", phone: "9751665"),
    Person(name: "Maria", address: "av mlsis", phone: "88888888"),
  ];

  List<Carrera> carrerasList = [
    Carrera(nombre: "Contabilidad", duracion: "5 años"),
    Carrera(nombre: "Diseño", duracion: "5 años"),
  ];

  List<Matricula> matriculasList = [];

  List<Institucion> institucioneslist = [];

  TextEditingController nameInstituteController = TextEditingController();
  TextEditingController adressInstituteController = TextEditingController();
  TextEditingController rucInstituteController = TextEditingController();
  TextEditingController phoneInstituteController = TextEditingController();
  TextEditingController carrerasInstituteController = TextEditingController();

  TextEditingController namePersonController = TextEditingController();
  TextEditingController adressPersonController = TextEditingController();
  TextEditingController dniPersonController = TextEditingController();
  TextEditingController phonePersonController = TextEditingController();

  Widget inputForm(
      TextEditingController controller, String text, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: text,
      ),
    );
  }

  String? _value;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${now.day}/${now.month}/${now.year}";
    String formattedTime = "${now.hour}:${now.minute}";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Matriculas App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff1C2433),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //AGREGAR INSTITUCIONES
              Alert(
                  context: context,
                  title: "INSTITUCIÓN",
                  content: Column(
                    children: [
                      inputForm(nameInstituteController, 'Nombre',
                          Icons.account_balance),
                      inputForm(adressInstituteController, 'Direccion',
                          Icons.edit_location),
                      inputForm(rucInstituteController, 'RUC', Icons.dialpad),
                      inputForm(
                          phoneInstituteController, 'Telefono', Icons.phone),
                      inputForm(carrerasInstituteController, 'Carreras',
                          Icons.layers),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      onPressed: () {
                        final List<String> ListaCarrera =
                            carrerasInstituteController.text.split(",");
                        institucioneslist.add(
                          Institucion(
                            nombre: nameInstituteController.text,
                            direccion: adressInstituteController.text,
                            ruc: rucInstituteController.text,
                            telefono: phoneInstituteController.text,
                            carreras: ListaCarrera.map(
                                (carrera) => Carrera(nombre: carrera)).toList(),
                            matriculas: [],
                          ),
                        );
                        print(carrerasInstituteController.text.split(","));
                        setState(() {});
                        nameInstituteController.clear();
                        adressInstituteController.clear();
                        rucInstituteController.clear();
                        phoneInstituteController.clear();
                        carrerasInstituteController.clear();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "AGREGAR",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ]).show();

              setState(() {});
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          ...institucioneslist.map(
            (institucionElement) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${institucionElement.nombre}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("agregando-............");
                        Alert(
                            context: context,
                            title: "${institucionElement.nombre}",
                            content: Container(
                              height: 300,
                              width: 300,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    inputForm(namePersonController, 'Nombre',
                                        Icons.account_circle),
                                    inputForm(adressPersonController,
                                        'Direccion', Icons.edit_location),
                                    // inputForm(rucInstituteController, 'DNI',
                                    //     Icons.dialpad),
                                    inputForm(phonePersonController, 'Teléfono',
                                        Icons.phone),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "Elige tu carrera",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    StatefulBuilder(
                                        //Sirve para que el modal tenga su estado y se puedaa actualizar.
                                        builder: (context, setState) {
                                      return Container(
                                        // height: 200,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ...List.generate(
                                                institucionElement
                                                    .carreras.length, (index) {
                                              final carre = institucionElement
                                                  .carreras[index];
                                              return RadioListTile(
                                                  value: index
                                                      .toString(), //mismo tipo que el _value
                                                  groupValue: _value,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = val;
                                                      print(_value);
                                                    });
                                                  },
                                                  activeColor: Colors.green,
                                                  title: Text(carre.nombre));
                                            })
                                            // ...institucionElement.carreras.map(
                                            //   (carrera) => RadioListTile(
                                            //       value: carrera.nombre,
                                            //       groupValue: _value,
                                            //       onChanged: (val) {
                                            //         setState(() {
                                            //           _value = val;
                                            //         });
                                            //       },
                                            //       activeColor: Colors.green,
                                            //       title: Text(carrera.nombre)),
                                            // ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            buttons: [
                              DialogButton(
                                onPressed: () {
                                  institucionElement.matriculas.add(
                                    Matricula(
                                      fecha: formattedDate,
                                      hora: formattedTime,
                                      alumno: Person(
                                          name: namePersonController.text,
                                          address: adressPersonController.text,
                                          phone: phonePersonController.text),
                                      carrera: institucionElement
                                          .carreras[int.parse(_value!)],
                                    ),
                                  );

                                  print(carrerasInstituteController.text
                                      .split(","));
                                  setState(() {});
                                  namePersonController.clear();
                                  adressPersonController.clear();
                                  phonePersonController.clear();
                                  _value = null;
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "AGREGAR",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ]).show();
                        setState(() {});
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        print("eliminandooo INSTITUCIÓN............");
                        institucioneslist.remove(institucionElement);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        print("eliminandooo MATRICULAS............");
                        // institucionElement.matriculas.removeRange(0, institucionElement.matriculas.length);
                        institucionElement.matriculas =
                            []; //hace lo mismo que arriba, borrar todads las matriculas
                        setState(() {});
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
                ...institucionElement.matriculas.map(
                  (e) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      // radius: 25,
                      child: Text(
                        e.alumno.name[0],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    title: Text("${e.alumno.name} - ${e.carrera.nombre}"),
                    subtitle: Text("${e.alumno.address} - ${e.alumno.phone}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Editando....");
                            e.alumno = Person(
                                name: "ANITA",
                                address: "CCALLE 456",
                                phone: "9876543");
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("Eliminando....");
                            // matriculasList.removeLast();
                            // matriculasList.removeRange(0, 2);
                            // matriculasList.removeAt(1);
                            institucionElement.matriculas.remove(e);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
