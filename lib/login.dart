import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _id = '';
  String _password = '';
  final _idEditingController = TextEditingController();
  final _pwdEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Fill Login Field"),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _idEditingController,
                      decoration: InputDecoration(
                        labelText: 'ID',
                        border: OutlineInputBorder()
                      ),
                      onChanged: (id) {
                        _id = id;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _pwdEditingController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder()
                      ),
                      onChanged: (password) {
                        _password = password;
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    print(_id);
                    print(_password);
                  }, child: Text("Login")),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ), onPressed: () {
                      print("Register Button Pressed");
                  }, child: Text("Register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
