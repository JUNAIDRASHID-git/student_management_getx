import 'package:get/get.dart';
import 'package:studentmanagement/functions/db_functions.dart';
import 'package:studentmanagement/model/student_model.dart';

class Controller extends GetxController {
  
  RxList<StudentModel> studentList = RxList<StudentModel>([]);

  RxList<StudentModel> searchStudentList = RxList<StudentModel>([]);

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final data = await getAllStudents();
    studentList.clear();
    studentList.addAll(data);
    searchStudentList.assignAll(studentList);
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      searchStudentList.assignAll(studentList);
    } else {
      searchStudentList.assignAll(
        studentList.where(
          (student) => student.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  @override
  void refresh() {
    fetchStudents();
    super.refresh();
  }
}
