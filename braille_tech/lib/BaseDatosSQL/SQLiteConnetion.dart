import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    String path = join(await getDatabasesPath(), 'BrailleTechSqlite.db');

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
}

Future<void> checkTables() async {
  final db = await LocalDB().database;
  final result =
      await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
  print(result); // Imprime las tablas existentes
}
