
import 'package:myfirstflutterpro/database/StudentService.dart';
import 'package:myfirstflutterpro/models/Student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDB {
  final tableName = 'student';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
        "id" INTEGER NOT NULL,
         "name" TEXT,
         "email" TEXT,
         "mobile" TEXT,
         "enteredAt" TEXT,
         "updatedAt" TEXT,
         PRIMARY KEY ("id" AUTOINCREMENT)
     );""");
  }

  Future<int> createStudent(final Student student) async {
    final database = await StudentService().database;
    return await database!.rawInsert(
      'INSERT INTO $tableName (name,email,mobile,enteredAt) VALUES (?,?,?,?)',
      [student.name, student.email, student.mobile, DateTime.now().toString()],
    );
  }

  Future<List<Student>> getStudent() async {
    List<Student> students = [];
    final database = await StudentService().database;
    var data = await database!.rawQuery(
      'SELECT * FROM $tableName'
    );
    data.forEach((element) {
      students.add(Student(name: element["name"].toString(), email: element["email"].toString(), mobile: element["mobile"].toString(), enteredAt: element["enteredAt"].toString()));
    });
    return students;
  }
}
