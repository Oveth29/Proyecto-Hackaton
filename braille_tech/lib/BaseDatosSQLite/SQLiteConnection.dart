import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Database? _database;

  Future<Database> get database async {
    //Valida si existe una base de datos
    if (_database != null) return _database!; //Si existe, la retorna

    _database = await _initializeDB(); //si no existe la crea
    return _database!;
  }

  Future<Database> _initializeDB() async {
    //Crea la base de datos
    String path = join(await getDatabasesPath(),
        'BrailleTechSqlite.db'); //guarda en path la dirección de la base de datos

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Crear tablas
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

        // Insertar datos iniciales
        await db.execute(
            "INSERT INTO Universidades(Nombre) VALUES ('UNIVERSIDAD DEL VALLE');");
        await db.execute("INSERT INTO Idiomas(Idioma) VALUES ('Español');");
        await db.execute("INSERT INTO Idiomas(Idioma) VALUES ('Inglés');");
        await db.execute("INSERT INTO Idiomas(Idioma) VALUES ('Portgués');");
        await db.execute("INSERT INTO Idiomas(Idioma) VALUES ('Frances');");
      },
    );
  }

  Future<void> addUsuario(
      //Agrega un usuario a la base de datos
      String nombre,
      String fotoPerfil,
      int idIdioma,
      int idUniversidad) async {
    final db = await database;

    // Usamos rawInsert en lugar de rawQuery
    await db.rawInsert('''
    INSERT INTO Usuarios (Nombre, FotoPerfil, Id_Universidad, Id_Idioma)
    VALUES (?, ?, ?, ?);
  ''', [
      nombre,
      fotoPerfil,
      idIdioma,
      idUniversidad
    ]); // Pasamos los valores con placeholders
    print("Nuevo USUARIO agregado====================");
  }

  //Agregamos un numero de mergencia
  Future<void> addNumeroEmergencia(int Id_Usuarios, String Numero) async {
    final db = await database;

    //usamos rawInsert para realizar una insercion SQL limpia
    await db.rawInsert('''
    INSERT INTO NumerosEmergencia (Id_Usuarios, Numero)
    VALUES (?, ?);
  ''', [
      Id_Usuarios,
      Numero,
    ]); // Pasamos los valores con placeholders
    print("Nuevo Numero agregado====================");
  }

  //Actualiza el numero de emergencia
  Future<void> updateNumEmergencia(int userid_2, String newNum) async {
    final db = await database;
    await db.rawUpdate('''
    UPDATE NumerosEmergencia
    SET Numero = '${newNum}'
    WHERE IdNumEmergencia = ${userid_2};
''');
    print('Actualización de Num exitosa');
  }

  //Actualiza el nombre del usuario
  Future<void> updateUsuario(int userid, String newName) async {
    final db = await database;
    await db.rawUpdate('''
    UPDATE Usuarios
    SET Nombre = '${newName}'
    WHERE IdUsuarios = ${userid};
''');
    print('Actualización exitosa');
  }

  //Obtiene el nombre del usuario desde la base de datos
  Future<String?> getUsuarioNombre(dynamic IdUser) async {
    final Database db = await database;
    final List<Map<String, dynamic>> res = await db.rawQuery('''
  SELECT u.Nombre
  FROM Usuarios u
  WHERE IdUsuarios = ${IdUser};
''');
    // Comprobar si hay resultados
    if (res.isNotEmpty) {
      return res.first['Nombre']
          as String?; // Retorna el primer nombre encontrado
    } else {
      return null; // Si no se encuentra, retorna null
    }
  }

  //Obtiene el numero de emergencia desde la base de datos
  Future<String?> getNumeroEmergencia(int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'NumerosEmergencia',
      columns: ['Numero'],
      where: 'Id_Usuarios = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return result.first['Numero'] as String?;
    } else {
      return null; // Devuelve null si no se encuentra el número
    }
  }
}

//Funcion que valida si existen tablas en la base de datos y nos devuelve los nombres
Future<void> checkTables() async {
  final db = await LocalDB().database;
  final result =
      await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
  print(result); // Imprime las tablas existentes
}

//Funcion que valida si hay datos insertados dentro de la tabla Usuarios
Future<void> checkUsuarios() async {
  final Database db = await LocalDB().database;
  final List<Map<String, dynamic>> res =
      await db.rawQuery('SELECT * FROM Usuarios');
  print(res); //Imprime todos los usuarios para verificar si existen registros
}
