import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;

class LocalDB {
  Future get database async {
    if (_database != null)
      return _database; //Si no es nula retornamos la BD que tenemos
    _database = await _initializeDB(
        'BrailleTechSqlite1.db'); //Si es nula creamos esta nueva BD
    return _database;
  }

  Future _initializeDB(String filepath) async {
    //Metodo para inicializar la BD
    final dbpath = await getDatabasesPath(); //Establece la BD en dbpath
    final path =
        join(dbpath, filepath); //Union entre obtención de la BD y los archivos
    return await openDatabase(path, version: 2, onCreate: _CreateDB);
  }

  Future _CreateDB(Database db, int version) async {
    //Metodo para asignar Version
    await db.execute('''
    CREATE TABLE Universidades(
    IdUniversidad INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre VARCHAR(50) NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE Idiomas(
    IdIdioma INTEGER PRIMARY KEY AUTOINCREMENT,
    Idioma VARCHAR(20) NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE Usuarios(
    IdUsuarios INTEGER PRIMARY KEY AUTOINCREMENT,
    Id_Universidad INTEGER,
    Id_Idioma INTEGER,
    Nombre VARCHAR(100) NOT NULL,
    FotoPerfil VARCHAR(255) NOT NULL,
    FOREIGN KEY(Id_Universidad) REFERENCES Universidades(IdUniversidad),
    FOREIGN KEY(Id_Idioma) REFERENCES Idiomas(IdIdioma)
    );
    ''');

    await db.execute('''
    CREATE TABLE NumerosEmergencia(
    IdNumEmergencia INTEGER PRIMARY KEY AUTOINCREMENT,
    Id_Usuarios INTEGER,
    Numero VARCHAR(20) NOT NULL,
    FOREIGN KEY(Id_Usuarios) REFERENCES Usuarios(IdUsuarios)
    );
  ''');

    await db.execute('''
  INSERT INTO Universidades(Nombre)
  VALUES ('UNIVERSIDAD DEL VALLE');
  ''');

    await db.execute('''
  INSERT INTO Idiomas(Idioma)
  VALUES ('Español');
  ''');
    await db.execute('''
  INSERT INTO Idiomas(Idioma)
  VALUES ('Inglés');
  ''');
    await db.execute('''
  INSERT INTO Idiomas(Idioma)
  VALUES ('Portgués');
  ''');
    await db.execute('''
  INSERT INTO Idiomas(Idioma)
  VALUES ('Frances');
  ''');
    await db.execute('''
  INSERT INTO Usuarios(Nombre, FotoPerfil, Id_Idioma, Id_Universidad)
  VALUES ('Nombre', 'No hay ninguna', 1, 1);
  ''');
  }

  Future<String> updateUsuario({required int userId, required String newName}) async {
    final db = await database; // Obtiene la instancia de la base de datos
    int count = await db.update(
      "Usuarios", // Tabla donde se actualizará el dato
      {"Nombre": newName}, // Datos que se actualizarán
      where: "IdUsuarios = ?", // Condición de actualización
      whereArgs: [userId], // Argumentos para la condición
    );

    if (count > 0) {
      return 'Usuario actualizado';
    } else {
      return 'Error al actualizar usuario';
    }
  }

  Future<String> addNumEmergencia({required String NumEmergencia}) async {
    final db = await database;
    await db.insert("NumerosEmergencia", {
      "Numero": NumEmergencia,
      "Id_Usuarios": 1 // Asegúrate de que el usuario con Id 1 exista
    });
    return 'added';
  }
}