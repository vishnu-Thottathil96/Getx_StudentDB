import 'package:sqflite/sqflite.dart';

import '../model/student_model.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  factory DB() => DB._();

  late Database db;

  Future initialiseDatabase() async {
    db = await openDatabase(
      'student.db',
      version: 1,
      onCreate: (db, version) async => db.execute(
          'CREATE TABLE Student(id INTEGER PRIMARY KEY,name TEXT,address TEXT,batch TEXT,mobile TEXT,email TEXT,image TEXT)'),
    );
  }

  Future<List<StudentModel>> getStudents() async {
    List<Map<String, Object?>> list =
        await db.rawQuery('SELECT * FROM Student');

    return list.isEmpty
        ? []
        : list.map((student) => StudentModel.fromMap(student)).toList();
  }

  // inserting data into database

  Future<bool> addStudent(StudentModel student) async {
    try {
      db.rawInsert(
          'INSERT INTO Student(name,address,batch,mobile,email,image) VALUES(?,?,?,?,?,?)',
          [
            student.name,
            student.address,
            student.batch,
            student.phone,
            student.mail,
            student.image,
          ]);

      await getStudents();
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<void> updateStudent(StudentModel student) async {
    try {
      await db.update(
        'Student',
        student.toMap(), // Assuming you have a toMap() method in StudentModel
        where: 'id = ?',
        whereArgs: [student.id],
      );
    } catch (e) {
      print('Error updating student: $e');
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }

  deleteStudent(int id) async {
    await db.delete('Student', where: 'id=?', whereArgs: [id]);
  }
}
