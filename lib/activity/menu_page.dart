import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterpro/activity/employee.dart';
import 'package:myfirstflutterpro/activity/student_entry.dart';
import 'package:myfirstflutterpro/activity/student_list.dart';

import '../database/StudentDB.dart';
import 'navigation_menu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("Menu", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => StudentEntry()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset('assets/images/nblogo.png',
                                      width: 80.0, height: 80.0),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'Student Entry',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 11,
                                  backgroundColor: Colors.black12),
                            ))
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => StudentList()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset('assets/images/nblogo.png',
                                      width: 80.0, height: 80.0),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'Student List',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 11),
                            ))
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EmployeeEntry()));
                                },
                                child: Image.asset('assets/images/nblogo.png',
                                    width: 80.0, height: 80.0),
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'Employee Entry',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 11,
                                  backgroundColor: Colors.black12),
                            ))
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => NavigationPage()));
                                },
                                child: Image.asset('assets/images/nblogo.png',
                                    width: 80.0, height: 80.0),
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'Navigation Menu',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 11),
                            ))
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset('assets/images/nblogo.png',
                                  width: 80.0, height: 80.0),
                            ),
                            Expanded(
                                child: Text(
                              'Map',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 11,
                                  backgroundColor: Colors.black12),
                            ))
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset('assets/images/nblogo.png',
                                    width: 80.0, height: 80.0)),
                            Expanded(
                                child: Text(
                              'Transaction Otp',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 11),
                            ))
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
