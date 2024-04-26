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
        validators: [Validators.required, Validators.number, Validators.min(1000)])
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
        title: Text("Student Entry", style: TextStyle(color: Colors.white)),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Column(
           children: [
             Expanded(
               child:Column(
                 children: [
                   ReactiveTextField(
                     formControlName: 'name',
                     validationMessages: {
                       'required': (error) => 'The name must not be empty',
                       'minLength': (error) => 'Min length should be 3'
                     },
                   ),
                   ReactiveTextField(
                     formControlName: 'fatherName',
                     validationMessages: {
                       'required': (error) => 'The father name must not be empty',
                       'minLength': (error) => 'Min length should be 3'
                     },
                   ),
                   ReactiveTextField(
                     formControlName: 'email',
                     validationMessages: {
                       'required': (error) => 'The name must not be empty',
                       'email': (error) => 'please provide right email'
                     },
                   ),
                 ],
               ),
             ),
             Expanded(child:
                 Row(
                   children: [
                     Text("gender", style: TextStyle(color: Colors.white)),
                     ReactiveRadio(value: 'M',formControlName: 'gender'),
                     ReactiveRadio(value: 'F',formControlName: 'gender',)
                   ],
                 )
             ),
             Expanded(
                 child: ReactiveTextField(
                   formControlName: 'salary',
                   validationMessages: {
                     'required':(error)=>'Salary Required !',
                     'min':(error)=>'min salary must be 1000 !'
                   },
                 )

             )
           ],
        )
      ),
    );
  }
}
