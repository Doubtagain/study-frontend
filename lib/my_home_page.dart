
import 'package:flutter/material.dart';

// CamelCase
// snake_case
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int number = 0;
  String password = '';
  String Id = '';
  String _text = '';
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 200),
              Container(height: 30),
          
          
          
              Text('숫자', style: TextStyle(color: Colors.black, fontSize: 40)),
              Text('$number', style: TextStyle(color: Colors.red, fontSize: 70)),
              ElevatedButton(onPressed: () {
                print('ElevatedButton');
              }, child: Text('ElevatedButton')),
              TextButton(onPressed: () {
                print('TextButton');
              }, child: Text('TextButton')),
          
              // SignUp
              Text('회원가입', style: TextStyle(color: Colors.black, fontSize: 40),),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _myController,
                      decoration: InputDecoration(
                        labelText: '글자',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        _text = text;
                      },

                    ),
                  ),
                  Expanded(
                    flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            print(_myController.text);
                            // refresh
                            setState(() {

                            });
                          },
                          child: Text('login'),
                      ),
                  ),
                ],
              ),
              Text(_myController.text),
              Image.network(
                'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg',
                width: 100,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.red,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/pic.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ),
              )
          
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
