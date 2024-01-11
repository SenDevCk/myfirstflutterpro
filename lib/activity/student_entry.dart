import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstflutterpro/database/StudentDB.dart';
import 'package:myfirstflutterpro/models/Student.dart';

import 'menu_page.dart';

class StudentEntry extends StatefulWidget {
  const StudentEntry({super.key});

  @override
  State<StudentEntry> createState() => _HomePageState();
}

class _HomePageState extends State<StudentEntry> {
  final _formKey = GlobalKey<FormState>();
  Student _student=Student(name: '', email: '', mobile: '', enteredAt: '');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.deepOrange,
          title: Text("Student", style: TextStyle(color: Colors.white)),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 0),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid Name';
                          }
                          _student.name=value;
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Name',
                            labelText: 'name'))),
                Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        if (!value.isEmail) {
                          return 'Please enter valid Email';
                        }
                        _student.email=value;
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'abc@gmail.com',
                          border: OutlineInputBorder()),
                    )),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Mobile';
                      }
                      if (value.length!=10) {
                        return 'Please enter valid Mobile';
                      }
                      _student.mobile=value;
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'phone',
                        hintText: '10 digits only',
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //print(_student.toString());
                        StudentDB().createStudent(_student);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => MenuPage()));
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  
}
