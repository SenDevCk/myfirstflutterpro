import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      child: Image.asset('assets/images/nblogo.png'),
                    ),
                    Expanded(
                        child: Text(
                          'Transaction Otp',
                          style: TextStyle(color: Colors.blueGrey,
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
                        child: Image.asset('assets/images/nblogo.png')
                    ),
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
      ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset('assets/images/nblogo.png'),
                          ),
                          Expanded(
                              child: Text(
                                'Transaction Otp',
                                style: TextStyle(color: Colors.blueGrey, fontSize: 11,backgroundColor: Colors.black12),

                              ))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset('assets/images/nblogo.png')
                          ),
                          Expanded(
                              child: Text(
                                'Transaction Otp',
                                style: TextStyle(color: Colors.blueGrey, fontSize: 11),
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
                            child: Image.asset('assets/images/nblogo.png'),
                          ),
                          Expanded(
                              child: Text(
                                'Transaction Otp',
                                style: TextStyle(color: Colors.blueGrey, fontSize: 11,backgroundColor: Colors.black12),

                              ))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset('assets/images/nblogo.png')
                          ),
                          Expanded(
                              child: Text(
                                'Transaction Otp',
                                style: TextStyle(color: Colors.blueGrey, fontSize: 11),
                              ))
                        ],
                      ))
                ],
              ),
            )
      ],
    ),)
    );
  }
}
