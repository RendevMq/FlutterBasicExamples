import 'package:w5_e2matriculas/models/carrera_model.dart';
import 'package:w5_e2matriculas/models/matricula_model.dart';

class Institucion {
  String nombre;
  String direccion;
  String ruc;
  String telefono;
  List<Carrera> carreras; 
  List<Matricula> matriculas;
  Institucion({
    required this.nombre,
    required this.direccion,
    required this.ruc,
    required this.telefono,
    required this.carreras,
    required this.matriculas,
  });

  void obtenerNumMatriculados() {
    print("$nombre tiene ${matriculas.length} matriculados");
  }
}
