import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterpro/database/StudentDB.dart';
import 'package:myfirstflutterpro/models/Student.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}


class _StudentListState extends State<StudentList> {
  List<Student> students=[];
  var count;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //var student = StudentDB().getStudent();
    //student.then((value) { if (value != null) value.forEach((item) => students.add(item));});
    //print(students);
  }

  @override
  Widget build(BuildContext context) {
    //if (students == null) {

      updateListView();
    //}
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.deepOrange,
        title: Text("Student Entry",style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              students[index].name, style: TextStyle(color: Colors.blue),),
            subtitle: Text(students[index].mobile),
          );
        },
      ),
    );
  }

  void updateListView() {
     //students = List<Student>();
    var student = StudentDB().getStudent();
    student.then((value) {
      setState(() {
        this.students = value;
        this.count = students.length;
      });
    });
  }
}
