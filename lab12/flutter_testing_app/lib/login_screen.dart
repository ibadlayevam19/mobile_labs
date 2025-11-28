import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState()=>_LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();

  bool isValid=false;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          onChanged: (){
            setState((){
              isValid=_formKey.currentState!.validate();
            });
          },
          child: Column(
            children: [
              TextFormField(
                key: Key('email'),
                controller: emailController,
                validator:(value){
                  if(value==null||value.isEmpty) return 'Required';
                  if(!value.contains('@')) return 'Invalid email';
                  return null;
                },
              ),
              TextFormField(
                key: Key('password'),
                controller: passController,
                validator: (value)=>
                    value==null ||value.isEmpty? 'Required':null,
              ),
              ElevatedButton(
                key: Key('submit'),
                onPressed: isValid? (){}:null,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}