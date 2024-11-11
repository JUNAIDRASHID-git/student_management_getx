import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentmanagement/model/student_model.dart';


class StudentProfileScreen extends StatelessWidget {
  final StudentModel studentDetails;
  const StudentProfileScreen({super.key, required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [ Column(
          
          children: [
            const SizedBox(
                height: 20,
              ),
            Container(
              width: 400,
              decoration: BoxDecoration(color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File(studentDetails.img)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${studentDetails.name.toUpperCase()}",
                          style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Age : ${studentDetails.age}",
                          style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.numbers),
                        Text(
                      "Roll Number : ${studentDetails.rollNum}",
                      style: const TextStyle(fontSize: 20),
                    ),
                      ],
                    ),
                   Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.phone),
                        Text(
                      "Phone Number : ${studentDetails.phoneNum}",
                      style: const TextStyle(fontSize: 20),
                    ),
                      ],
                    ),
                  ],
                ),
              ),
                      
              const SizedBox(
                height: 10,
              ),
                      
                ],
              ),
            ),

            const SizedBox(height: 20,),

            

                //cards



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
                  height: 200,
                  width: 200,
                  child: const Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.school_outlined,color: Colors.white,size: 100,),
                      Text('Syllabus',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
                  ),
                  Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
              height: 200,
              width: 200,
              child: const Center(child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.format_list_numbered,color: Colors.white,size: 100,),
                      Text('Attandance',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
              ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
                  height: 200,
                  width: 200,
                  child: const Center(child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.home_work,color: Colors.white,size: 100,),
                      Text('Home Work',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
                  ),
                  Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
              height: 200,
              width: 200,
              child: const Center(child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.masks_rounded,color: Colors.white,size: 100,),
                      Text('Result',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
              ),
              ],
            ),
             const SizedBox(
              height: 10,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
                  height: 200,
                  width: 200,
                  child: const Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.payment,color:  Colors.white,size: 100,),
                      Text('Fees',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
                  ),
                  Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
              height: 200,
              width: 200,
              child: const Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.assignment,color: Colors.white,size: 100,),
                      Text('Assignments',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ]
                  ))
              ),
              ],
            ),

             const SizedBox(
              height: 10,
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
                  height: 200,
                  width: 200,
                  child: const Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.book_outlined,color: Colors.white,size: 100,),
                      Text('Exam',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
                  ),
                  Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple[200]),
              height: 200,
              width: 200,
              child: const Center(child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(Icons.more,color: Colors.white,size: 100,),
                      Text('More',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ],
                  )),
              ),
              
              ],
            ),
              
        
          ],
        ),]
      ),
    );
  }
}
