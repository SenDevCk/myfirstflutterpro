import 'dart:async';



import 'package:flutter/material.dart';
import 'package:myfirstflutterpro/activity/login.dart';
import 'package:permission_handler/permission_handler.dart';


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
  }

  Future<int> permissionCheck() async{
    int countPermissionEnabled=0;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.sms,
      //add more permission to request here.
    ].request();
    /*if (statuses[Permission.phone]!.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      print("Permission is denined.");
      countPermissionEnabled--;
    }else if(statuses[Permission.phone]!.isGranted){
      //permission is already granted.
      print("Permission is already granted.");
      countPermissionEnabled++;
    }else if(statuses[Permission.phone]!.isPermanentlyDenied){
      //permission is permanently denied.
      print("Permission is permanently denied");
      countPermissionEnabled--;
    }else if(statuses[Permission.phone]!.isRestricted){
      //permission is OS restricted.
      print("Permission is OS restricted.");
      countPermissionEnabled--;
    }*/
    //permission for sms
    if (statuses[Permission.sms]!.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      print("Permission is denined.");
      countPermissionEnabled--;
      openAppSettings();
    }else if(statuses[Permission.sms]!.isGranted){
      //permission is already granted.
      print("Permission is already granted.");
      countPermissionEnabled++;
    }else if(statuses[Permission.sms]!.isPermanentlyDenied){
      //permission is permanently denied.
      print("Permission is permanently denied");
      countPermissionEnabled--;
    }else if(statuses[Permission.sms]!.isRestricted){
      //permission is OS restricted.
      print("Permission is OS restricted.");
      countPermissionEnabled--;
    }
    return countPermissionEnabled;
  }

  void goTonext(BuildContext context) async {
   if(await permissionCheck()>=1) {
     await Future.delayed(Duration(seconds: 10), () {
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => Login()));
     });
   }else{
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
       content: Text("Please Enable All Permissions !"),
     ));
     goTonext(context);
   }
  }


}


