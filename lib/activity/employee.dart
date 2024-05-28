

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EmployeeEntry extends StatefulWidget {
  const EmployeeEntry({super.key});

  @override
  State<EmployeeEntry> createState() => _EmployeeEntryState();
}

class _EmployeeEntryState extends State<EmployeeEntry> {
  final form = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'fatherName': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email,]),
    'gender': FormControl<String>(
        validators: [Validators.required]),
    'salary': FormControl<double>(
        validators: [Validators.required, Validators.min(1000)])
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.deepOrange,
        title: Text("Employee Entry", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(child:Container(
        margin: new EdgeInsets.all(15.0),
        child: ReactiveForm(
        formGroup: form,
        child: Column(
           children: <Widget>[
                    Padding(
                    padding: EdgeInsets.only(
                    left: 15, top: 10, right: 15, bottom: 0),
                    child: ReactiveTextField(
                     formControlName: 'name',
                     decoration: InputDecoration(
                       labelText: 'Name',
                       border: OutlineInputBorder(),
                       contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                     ),
                      textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.text,
                     validationMessages: {
                       'required': (error) => 'The name must not be empty',
                       'minLength': (error) => 'Min length should be 3'
                     },
                   )),
            Padding(
              padding: EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 0),
                   child: ReactiveTextField(
                     formControlName: 'fatherName',
                     textInputAction: TextInputAction.next,
                     decoration: InputDecoration(
                       labelText: 'Father Name',
                       border: OutlineInputBorder(),
                       contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                     ),
                     keyboardType: TextInputType.text,
                     validationMessages: {
                       'required': (error) => 'The father name must not be empty',
                       'minLength': (error) => 'Min length should be 3'
                     },
                   )),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
              child: ReactiveTextField(
                     formControlName: 'email',
                     textInputAction: TextInputAction.next,
                     decoration: InputDecoration(
                       labelText: 'Email',
                       border: OutlineInputBorder(),
                       contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                     ),
                     keyboardType: TextInputType.emailAddress,
                     validationMessages: {
                       'required': (error) => 'The name must not be empty',
                       'email': (error) => 'please provide right email'
                     },
                   )),


            /* Expanded(child:
                 Row(
                   children: [
                     Text("gender", style: TextStyle(color: Colors.white)),
                     ReactiveRadio(value: 'M',formControlName: 'gender'),
                     ReactiveRadio(value: 'F',formControlName: 'gender',)
                   ],
                 )
             ),*/
             Padding(
                 padding: EdgeInsets.only(
                     left: 15, top: 10, right: 15, bottom: 0),
                 child: ReactiveTextField(
                   formControlName: 'salary',
                   decoration: InputDecoration(
                     labelText: 'Salary Amount',
                     border: OutlineInputBorder(),
                     contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                   ),
                   keyboardType: TextInputType.number,
                   validationMessages: {
                     'required':(error)=>'Salary Required !',
                     'min':(error)=>'Min amount 1000 !'
                   },
                 )

             ),
             Padding(
                 padding: EdgeInsets.only(
                     left: 15, top: 10, right: 15, bottom: 0),
             child: MaterialButton(
               onPressed: () => {
                 if(!form.invalid){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Provide write data"),
                    ))
                 }else{
                     log('data : $form.value')
                  }
               },
               child: Text('Submit'),
             )
             )
           ],
        )
      ),
    )
    ));
  }
}
