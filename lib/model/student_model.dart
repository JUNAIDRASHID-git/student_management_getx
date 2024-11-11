

class StudentModel{

 int? id;

final String img;

final String name;

final String age;

final String rollNum;

final String phoneNum;

  StudentModel({required this.img, required this.name, required this.age, required this.rollNum, required this.phoneNum,this.id});

static StudentModel fromMap(Map<String, Object?> map){
  final id = map['id'] as int;
  final img = map['img'] as String;
  final name = map['name'] as String;
  final age = map['age'] as String;
  final rollNum = map['rollNum'] as String;
  final phoneNum = map['phoneNum'] as String;

  return StudentModel(img: img, name: name, age: age, rollNum: rollNum, phoneNum: phoneNum,id:id);
}

}