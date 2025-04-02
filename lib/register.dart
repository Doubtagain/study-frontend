import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //PopUp for Register
  _showRegisterErrorDialog(BuildContext contexts) async {
    if(_id == '' || _password == '' || _name == '' || _univHouseType == '' || _email == '') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Please Fill ID, PWD, NAME, 기숙사, Email'),
            actions: [
              Center(
                child: ElevatedButton(onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  }, child: Text('Return to Register')),
              )
            ],
          );
        }
      );
    } else {
      var memberdata = {
        "loginId" : _id,
        "password": _password,
        "name": _name,
        "univHouseType": _univHouseType,
        "email": _email,
      };

      var body = jsonEncode(memberdata);

      http.Response _res = await http.post(Uri.parse("http://192.168.0.72:8080/api/member/signup"),
          headers: {"Content-Type" : 'application/json'},
          body: body
      );
      print(_res.statusCode);
      print(_res.body);

      if (_res.statusCode == 200) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {
              return AlertDialog(
                content: Text('Success to Login'),
                actions: [
                  Center(
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.pop(contexts);
                    }, child: Text('Return to Login')),
                  )
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {
              return AlertDialog(
                content: Text('Failed to Register'),
                actions: [
                  Center(
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    }, child: Text('ok')),
                  )
                ],
              );
            });
      }

    }
  }

  String _id = '';
  String _password = '';
  String _name = '';
  String _univHouseType = '';
  String _email = '';
  final _idEditingController = TextEditingController();
  final _pwdEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();
  final _univHouseTypeEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();

  Map<String, dynamic>? apiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register'),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: 200,
                height: 400,
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
                    SizedBox(height: 10,),
                    TextField(
                      controller: _nameEditingController,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder()
                      ),
                      onChanged: (name) {
                        _name = name;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _univHouseTypeEditingController,
                      decoration: InputDecoration(
                          labelText: '기숙사 타입',
                          border: OutlineInputBorder()
                      ),
                      onChanged: (univHouseType) {
                        _univHouseType = univHouseType;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _emailEditingController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder()
                      ),
                      onChanged: (email) {
                        _email = email;
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () async{
                await _showRegisterErrorDialog(context);
              }, child: Text("Register")),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Return to Login")),
            ],
          ),
        ),
      ),
    );
  }
}
