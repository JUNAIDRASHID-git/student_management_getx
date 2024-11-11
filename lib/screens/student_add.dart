import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentmanagement/functions/db_functions.dart';
import 'package:studentmanagement/model/student_model.dart';
import 'package:studentmanagement/screens/student_list.dart';

class StudentLiSt extends StatefulWidget {
  const StudentLiSt({super.key});

  @override
  State<StudentLiSt> createState() => _StudentLiStState();
}

String? selectedImage;

final _nameController = TextEditingController();
final _ageController = TextEditingController();
final _rollNumController = TextEditingController();
final _phoneNumController = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _StudentLiStState extends State<StudentLiSt> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Student",
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(255, 158, 135, 198),
      body: Form(
          key: _formKey,
          child: ListView(children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    pickImageFromGallary();
                  },
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage: selectedImage != null
                          ? FileImage(File(selectedImage!))
                          : const AssetImage('lib/assets/profile_icon3.png')
                              as ImageProvider),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 130, 0, 0)),
                      filled: true,
                      fillColor: Color.fromARGB(247, 255, 255, 255),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      final nameRegex = RegExp(r'^[a-zA-Z]{3,20}$');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Name';
                      } else if (!nameRegex.hasMatch(value)) {
                        return "Name Must be a Charactor";
                      } else if (value.length < 4) {
                        return 'Please Enter Name Grater Than 4 Charator';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 130, 0, 0)),
                      filled: true,
                      fillColor: Color.fromARGB(247, 255, 255, 255),
                      hintText: 'age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      final nameRegex = RegExp('^[0-9]');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Age';
                      } else if (!nameRegex.hasMatch(value)) {
                        return "Age Must be an Integer";
                      } else if (value.length > 2) {
                        return "Enter Age Between 0 to 30";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _rollNumController,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 130, 0, 0)),
                      filled: true,
                      fillColor: Color.fromARGB(247, 255, 255, 255),
                      hintText: 'ROLL Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      final nameRegex = RegExp('^[0-9]');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Roll Number';
                      } else if (!nameRegex.hasMatch(value)) {
                        return "Roll Number Must be an Integer";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNumController,
                    decoration: const InputDecoration(
                      prefix: Text("+91 "),
                      prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                      errorStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 130, 0, 0)),
                      filled: true,
                      fillColor: Color.fromARGB(247, 255, 255, 255),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      final nameRegex = RegExp('^[0-9]');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Phone Number !';
                      } else if (!nameRegex.hasMatch(value)) {
                        return "Phone Number Must be an Integer";
                      } else if (value.length != 10) {
                        return "Phone Number Must have 10 Digits";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Do you want to Add Student ?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              checkValue();
                                            });
                                            _nameController.clear();
                                            _ageController.clear();
                                            _rollNumController.clear();
                                            _phoneNumController.clear();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('no')),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text('SAVE')),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           StudentslistScreen()),
                                  (route) => false);
                            },
                            child: const Text('STUDENT LIST')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])),
    );
  }

  Future<void> checkValue() async {
    final String imagepath = selectedImage ?? 'null';

    final name = _nameController.text;
    final age = _ageController.text;
    final rollNum = _rollNumController.text;
    final phoneNum = _phoneNumController.text;

    final studentvalues = StudentModel(
        id: DateTime.now().microsecondsSinceEpoch,
        img: imagepath,
        name: name,
        age: age,
        rollNum: rollNum,
        phoneNum: phoneNum);

    addStudents(studentvalues);
  }

  Future pickImageFromGallary() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage = returnedImage.path;
    });
  }
}
