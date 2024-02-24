import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:w9_e2taskdb/Models/task_model.dart';

class DBAdmin {
  Database? myDatabase;

  // Implementación del patrón Singleton
  static final DBAdmin db = DBAdmin._instance();
  DBAdmin._instance();

  // Método para verificar o gestionar si la base de datos ya existe
  Future<Database?> checkDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    }

    // Si la base de datos es nula (no existe), la construimos
    myDatabase = await initDatabase();
    return myDatabase;
  }

  // Función para crear la base de datos
  Future<Database> initDatabase() async {
    // Obtener la ruta dinámica donde se instala la aplicación en el dispositivo
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "TaskDB.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database dbx, int version) async {
        // Sentencia SQL para la creación de la tabla dentro de TaskDB.db
        await dbx.execute(
            "CREATE TABLE TASK(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, description TEXT, status TEXT)");
      },
    );
  }

  //Metodo para insertar un task
  Future<int> insertRawTask(TaskModel model) async {
    Database? db = await checkDatabase();
    int res = await db!.rawInsert(
        "INSERT INTO TASK(title , description ,status) VALUES ('${model.title}','${model.description}','${model.status.toString()}')");
    print(res);
    return res;
  }

  Future<int> insertTask(TaskModel model) async {
    Database? db = await checkDatabase();
    int res = await db!.insert(
      "TASK",
      {
        "title": model.title,
        "description": model.description,
        "status": model.status.toString(),
      },
    );
    print(res);
    return res;
  }

  getRawTask() async {
    Database? db = await checkDatabase();
    List tasks = await db!.rawQuery(
        "SELECT * FROM TASK"); //CTRL + CLICK, vemos que es un future que devuelve una lista de mapas List<Map<String, Object?>>
    print(tasks);
  }

  Future<List<TaskModel>> getTask() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> tasks = await db!.query(
        "TASK"); //CTRL + CLICK, vemos que es un future que devuelve una lista de mapas List<Map<String, Object?>>
    //Creamos una Lista de mi modelo, el objetivo es convertir la lista de mapas a esta nueva lista
    // List<TaskModel> taskModelList = [];
    //SEGUNDA FORMA, mas directa
    List<TaskModel> taskModelList =
        tasks.map((e) => TaskModel.deMapAModel(e)).toList();
    //print(taskModelList);//[Instance of 'TaskModel', Instance of 'TaskModel']
    return taskModelList;
  }

  //METODO PARA OBTENER UN taskmodel por el ID
  Future<TaskModel?> getTaskbyID(int id) async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> tasks = await db!.query(
      "TASK",
      where: "id = $id",
    );
    print(tasks);
    print(TaskModel.deMapAModel(tasks[0]));

    if (tasks.isNotEmpty) {
      return TaskModel.deMapAModel(tasks[0]); //tambien puede ser tasks.fisrt
    } else {
      return null;
    }
  }

  updateRawTask() async {
    Database? db = await checkDatabase();
    int res = await db!.rawUpdate(
        "UPDATE TASK SET title = 'Bañar a los animales', description = 'Bañar al gato y al perro' , status= 'false' WHERE id = 2"); //se tiene qque especificar cual de todos los registros existentes quetemos modificar, sino se actualizaran toddos...CTRL + CLICK, vemos que es un future que devuelve un int
    print(res);
  }

  Future<int> updateTask(TaskModel model) async {
    Database? db = await checkDatabase();
    // db!.update(table, values)
    int res = await db!.update(
        //ctrl+ click y vemos que es un future que retorna un int, ademas se puede observar el tipo de dato que espera el argumentoo values ( Map<String, Object?> )
        "TASK",
        {
          "title": model.title,
          "description": model.description,
          "status": model.status
        },
        where:
            "id=${model.id}" //importante para que solo este registro se actualice, sino se modificarian todos
        );
    return res;
  }

  deleteRawTask() async {
    Database? db = await checkDatabase();
    int res = await db!.rawDelete("DELETE FROM TASK WHERE id=2");
    print(res);
  }

  Future<int> deleteTask(int id) async {
    Database? db = await checkDatabase();
    int res = await db!.delete(
      "TASK",
      where: "id = $id",
    );
    print(res);
    return res;
  }
}
