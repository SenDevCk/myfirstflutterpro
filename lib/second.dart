import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Second Page",style: TextStyle(
        color: Colors.white,
        fontSize: 20
      ),),
    ),
    body: Card(
      child: Text("Name:",style: TextStyle(
        color: Colors.black26,
        fontSize: 12
      )),

    ),
    );
  }
}
