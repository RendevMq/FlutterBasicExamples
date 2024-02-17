import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:w9_e1billsapp/db/db_admin.dart';
import 'package:w9_e1billsapp/modals/register_form_modal.dart';
import 'package:w9_e1billsapp/widgets/item_gasto_widget.dart';
import 'package:w9_e1billsapp/widgets/texfield_normal_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map> gastosList = [];

Future<void> getDataGeneral() async {
  gastosList = await DBAdmin().obtenerGastos();
  setState(() {});
}

@override
void initState() {
  super.initState();
  // Llama a la función getDataGeneral() al iniciar el widget
  getDataGeneral();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  showModalRegister() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: RegisterModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final DateTime now = DateTime.now();
    // print(now);
    // final DateFormat formatter = DateFormat('dd-MM-yyyy');
    // final String formatted = formatter.format(now);
    // print(formatted);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    //PRIMER FORMA , creando dbAdmin.. de esta forma no es ccorrecto ya que deberiamos instanciarlo siempre que lo necesitemos.

                    // DBAdmin dbAdmin = DBAdmin();
                    // dbAdmin.initDatabase();
                    // print(dbAdmin.checkDatabase());
                    print("iniciando db.....");

                    // dbAdmin.obtenerGastos();
                    // dbAdmin.insertarGasto();

                    //SEGUNDA FORMA , sin instanciar VARIAS VECES
                    DBAdmin().obtenerGastos();
                    // DBAdmin().insertarGasto();

                    showModalRegister();
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Color(0xff101321),
                    width: double.infinity,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Agregar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34),
                        bottomRight: Radius.circular(34),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Resumen de gastos",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Gestiona tus gastos de la mejor forma",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: TextFieldNormalWidget(
                                hintText: "Buscar por título",
                                controller: _searchController,
                              ),
                            ),
                            ItemGastoWidget(),
                            ItemGastoWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
