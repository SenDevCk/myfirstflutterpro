import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterpro/activity/menu_page.dart';
import 'package:myfirstflutterpro/activity/student_entry.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SecondState();
}

class _SecondState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.deepOrange,
        title: Text("Login",style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                      width: 80,
                      height: 80,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/nblogo.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter UserId';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      icon: Icon(Icons.supervised_user_circle),
                      labelText: 'UserId',
                      hintText: 'Enter valid UserId'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      icon: Icon(Icons.password),
                      labelText: '*****',
                      hintText: 'Enter secure password'),
                ),
              ),
              TextButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                  ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Under Development...')),
                       );
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: FilledButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => MenuPage()));
                    }
                  },
                  child: const Text('Login',style: TextStyle(color: Colors.white, fontSize: 25),)
                ),
              ),
             /* SizedBox(
                height: MediaQuery.of(context).size.height,
              ),*/
              Padding(padding: EdgeInsets.only(top: 10),
                 child:TextButton(onPressed: (){
                   Navigator.push(
                       context, MaterialPageRoute(builder: (_) => StudentEntry()));
                 },
                     child: Text('New User? Create Account')))
            ],
          ),
        ),
      ),
    );
  }
}


