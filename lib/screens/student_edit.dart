import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentmanagement/functions/db_functions.dart';
import 'package:studentmanagement/model/student_model.dart';
import 'package:studentmanagement/screens/student_list.dart';

class StudentEdit extends StatefulWidget {
  final StudentModel studentrecord;

  const StudentEdit({super.key, required this.studentrecord});

  @override
  State<StudentEdit> createState() => _StudentEditState();
}

final _formKey = GlobalKey<FormState>();

String? selectedImage;

TextEditingController _nameController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _rollNumController = TextEditingController();
TextEditingController _phoneNumController = TextEditingController();

class _StudentEditState extends State<StudentEdit> {
  @override
  void initState() {
    super.initState();
    selectedImage = widget.studentrecord.img;
    _nameController = TextEditingController(text: widget.studentrecord.name);
    _ageController = TextEditingController(text: widget.studentrecord.age);
    _rollNumController =
        TextEditingController(text: widget.studentrecord.rollNum);
    _phoneNumController =
        TextEditingController(text: widget.studentrecord.phoneNum);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _rollNumController.dispose();
    _phoneNumController.dispose();
    super.dispose();
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
                      label: Text('Name'),
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(247, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      label: Text('age'),
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      label: Text('ROLL Number'),
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      label: Text('Phone Number'),
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    validator: (value) {
                      final nameRegex = RegExp('^[0-9]');
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Phone Number';
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
                                    title:
                                        const Text("Do you want to Update ?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              checkValue(
                                                  widget.studentrecord.id!);
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                               StudentslistScreen()),
                                                      (route) => false);
                                            });
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
                            child: const Text('UPDATE')),
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

  Future<void> checkValue(int id) async {
    final String img = selectedImage ?? 'null';
    final name = _nameController.text;
    final age = _ageController.text;
    final rollNum = _rollNumController.text;
    final phoneNum = _phoneNumController.text;

    studentUpdate(id, img, name, age, rollNum, phoneNum);
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
