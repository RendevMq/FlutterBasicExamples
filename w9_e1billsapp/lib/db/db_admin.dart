import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:w9_e1billsapp/models/gasto_model.dart';

class DBAdmin {
  Database? myDataBase;

  //==========PATRON singleton=================//
  static final DBAdmin pepe =
      DBAdmin.mandarina(); //final, solo se asignara una vez

  DBAdmin.mandarina();

  factory DBAdmin() {
    return pepe;
  }
  //==============================================//

  Future<Database?> checkDatabase() async {
    //PRIMERA FORMA
    // if (myDataBase == null) {
    //   myDataBase = await initDatabase();
    // }
    // return myDataBase;

    //SEGUNDAD FOORMA
    myDataBase ??= await initDatabase();
    return myDataBase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    String pathDataBase = join(directory.path, "GastosDB.db");
    return await openDatabase(
      //el openDatabase retorna un database
      pathDataBase,
      version: 1,
      onCreate: (Database db, int version) {
        //Aqui enpezamos a crear nuestra base d daatos
        db.execute("""CREATE TABLE GASTOS(
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              title TEXT , 
              price REAL,
              datetime TEXT, 
              type TEXT
              )"""); //ejecutamos las sentencias SQL
      },
    );
  }

  //OBTENER DATOS
  Future<List<Map>> obtenerGastos() async {
    Database? db =
        await checkDatabase(); //Abrir la base de datos (o crearla si no existe)no
    List<Map> data = await db!.query("GASTOS"); //obtenemoos los datos
    //List data = await db!.rawQuery("SELECT TITLE, PRICE FROM GASTOS");//obtenemoos los datos personalizados con sentencias
    // List data = await db!.rawQuery("GASTOS", where: "TYPE='Alimentos'"); //revisarlooooo
    print(data);
    return data;
  }

  //INSERTAR GASTOS

  Future<int> insertarGasto(GastoModel gasto) async {
    Database? db = await checkDatabase();

    //=======PRIMER FORMA: SIN EL METODO DEL MOODELO=====//
    // Map<String, dynamic> gastoMap = {
    //   // Datos del gasto a insertar
    //   "title": gasto.title,
    //   "price": gasto.price,
    //   "datetime": gasto.dateTime,
    //   "type": gasto.type,
    // };
    //int res = await db!.insert("GASTOS", gastoMap); // Insertar el gasto en la tabla "GASTOS"
    //print(res);

    //=======SEGUNDA FORMA: CON EL MEETODO DEL MODELO ===//
    int res = await db!.insert("GASTOS", gasto.convertirAMAP());
    print(res);
    //DEBEMOS COMPROBAR SI LA INSERCION FUE EXITOSA
    return res;
  }

  //ACTUALIZAR GASTO

  //
}
