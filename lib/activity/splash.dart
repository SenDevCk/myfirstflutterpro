import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstflutterpro/activity/second.dart';


class Spalsh extends StatefulWidget {
  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  Widget build(BuildContext context) {
    goTonext(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      //margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),

     child: Column(
       children: [
         Expanded(
           flex: 19,
           child: Center(
               child: Container(
                 width: 200,
                 height: 200,
                 child: Column(
                   children: [
                     Image.asset("assets/images/nblogo.png"),
                     Text("Seitra",
                         style: TextStyle(color: Colors.red, fontSize: 16)),
                   ],
                 ),
               )),
         ),
         Expanded(
           flex: 1,
           child: Container(
             width:  double.infinity,
             color: Colors.green,
             child: Center(child: Text("Service Provided By NIC",style: TextStyle(color: Colors.white,fontSize: 10),)),
           ),
          ),

       ],
     ),


    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  scheduleTimeout(10000);
  }

  void goTonext(BuildContext context) async {
    await Future.delayed(Duration(seconds: 10));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Second(),maintainState: false));

  }


}

Timer scheduleTimeout([int milliseconds = 10000]) =>
    Timer(Duration(milliseconds: milliseconds), handleTimeout);

void handleTimeout() {
  // callback function
  // Do some work.
  print("object coming");
 Get.offAll(Second());
}
