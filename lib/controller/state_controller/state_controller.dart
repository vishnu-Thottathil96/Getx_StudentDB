import 'package:get/get.dart';
import 'package:studentdbgetx/controller/db_functions.dart';
import 'package:studentdbgetx/model/student_model.dart';

class StateManager extends GetxController {
  RxList<StudentModel> studentListRx = <StudentModel>[].obs;
  RxString studentImage = ''.obs;

  final db = DB();

  getFromDb() async {
    final list = await db.getStudents();
    studentListRx.assignAll(list);
  }

  addToDb(StudentModel student) async {
    await db.addStudent(student);
    getFromDb();
  }

  deleteFromDb(int id) async {
    await db.deleteStudent(id);
    getFromDb();
  }

  updateFromDb(StudentModel student, int id) async {
    await db.updateStudent(student, id);
    getFromDb();
  }

  searchHelper(String searchQuery) async {
    final searchList = await db.getStudents();
    final result = searchList
        .where(
          (student) => student.name.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();
    studentListRx.assignAll(result);
  }
}
