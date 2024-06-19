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
  Student _student=Student(name: '', email: '', mobile: '', userId: '', password: '', enteredAt: '');
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
          title: Text("Create Account", style: TextStyle(color: Colors.white)),
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
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
                          border: OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),

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
                        border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'UserId',
                            hintText: 'No any spacial character or space',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter UserID';
                        }
                        if (value.length<5) {
                          return 'Please enter valid userid min 5 character';
                        }
                        _student.password=value;
                        return null;
                      },
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                        labelText: 'Password',
                          hintText: '*****'
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        if (value.length<5) {
                          return 'Please enter valid password min 5 character';
                        }
                        _student.password=value;
                        return null;
                      },

                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    color: Colors.deepPurple,
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
                ),

              ],
            ),
          ),
        ));
  }

  
}
