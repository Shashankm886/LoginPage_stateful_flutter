import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();  
  }
}



class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String? email = ''; //validator has dynamic string? value so to accept those parameters here these should also be null safety string type string?
  String? password = '';


  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            // Container(margin: EdgeInsets.only(top: 25.0)),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
      ),
      validator: validateEmail, //helper function to use mixin for the validator function this increases resuability
      
      onSaved: (value) { 
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true, //makes for password dots if set to true
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      
      onSaved: (value){
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState!.validate()){
          formKey.currentState!.save();
          print('time to post $email and $password to my API');
        }
      },
      color: Color.fromARGB(255, 123, 179, 225),
    );
  }
}
