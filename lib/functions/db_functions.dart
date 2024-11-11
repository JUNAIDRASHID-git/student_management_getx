import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studentmanagement/assets/Controllers/controller.dart';
import 'package:studentmanagement/model/student_model.dart';

// ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
Controller controller = Get.put(Controller());

late Database _database;

Future<void> initializeDataBase() async {
  _database = await openDatabase(
    'studentdb.db',
    version: 2,
    onCreate: (Database database, int version) async {
      await database.execute(
          'CREATE TABLE studentdb (id INTEGER PRIMARY KEY , img TEXT , name Text , age TEXT , rollNum TEXT , phoneNum TEXT)');
    },
  );
}

Future<List<StudentModel>> getAllStudents() async {
  final values = await _database.rawQuery('SELECT * FROM studentdb');
  List<StudentModel> students = [];

  for (var map in values) {
    students.add(StudentModel.fromMap(map));
  }

  return students;
}

Future<void> addStudents(StudentModel value) async {
  controller.studentList.clear();
  await _database.rawInsert(
      'INSERT INTO studentdb (img,name,age,rollNum,phoneNum,id) VALUES(?,?,?,?,?,?)',
      [
        value.img,
        value.name,
        value.age,
        value.rollNum,
        value.phoneNum,
        value.id
      ]);
  controller.refresh();
}

Future<void> studentUpdate(int id, String img, String name, String age,
    String rollNum, String phoneNum) async {
  controller.studentList.clear();
  final data = {
    'img': img,
    'name': name,
    'age': age,
    'rollNum': rollNum,
    'phoneNum': phoneNum,
  };

  await _database.update('studentdb', data, where: 'id = ?', whereArgs: [id]);
  controller.refresh();
}

Future<void> deleteStudent(int id) async {
  controller.studentList.clear();
  await _database.rawDelete('DELETE FROM studentdb WHERE id = ?', [id]);
  controller.refresh();
}

Future fetchData() async {
  final values = await _database.rawQuery('SELECT * FROM studentdb');

  return values;
}
