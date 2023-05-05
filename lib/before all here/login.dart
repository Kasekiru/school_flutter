import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff89c5f9),
          child: Center(
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 50),
              padding: EdgeInsets.all(20),
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      hintText: 'John Doe',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _usernameController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: 'PoisonApple_413',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _passwordController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                    child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 18.0,
                        color: Colors.blue,
                        clipBehavior: Clip.antiAlias,
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 50,
                          color: Colors.blue,
                          child: Text('Submit',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp()),
                            );
                            setState(() {
                              //empty now
                            });
                          },
                        )))
              ]),
            ),
          ),
        ));
  }
}
