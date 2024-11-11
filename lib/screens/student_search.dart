import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentmanagement/assets/Controllers/controller.dart';

class StudentSearch extends StatelessWidget {
  const StudentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student List',
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(255, 158, 135, 198),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: controller.filterStudents,
              decoration: const InputDecoration(
                hintText: "SEARCH (Students)",
                filled: true,
                fillColor: Color.fromARGB(247, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.searchStudentList.isEmpty
                  ? const Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.searchStudentList.length,
                      itemBuilder: (context, index) {
                        var data = controller.searchStudentList[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: const Color.fromARGB(247, 255, 255, 255),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: data.img.isEmpty
                                    ? const AssetImage(
                                            'lib/assets/profile_icon3.png')
                                        as ImageProvider
                                    : FileImage(File(data.img)),
                                radius: 29,
                              ),
                              title: Text(
                                data.name.toUpperCase(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text("Age : ${data.age}"),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
