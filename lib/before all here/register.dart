import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  String? gender;
  bool checkedValue = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff89c5f9),
          child: Center(
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Username',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: gender,
                          onChanged: handleRadio,
                        ),
                        Text(
                          'Male',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: 'Female',
                          groupValue: gender,
                          onChanged: handleRadio,
                        ),
                        Text(
                          'Female',
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'PoisonApple413@gmail.com',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _emailController.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Re-Password',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _repasswordController,
                      decoration: InputDecoration(
                          hintText: 'PoisonApple_413',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _repasswordController.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CheckboxListTile(
                        title: Text('I have accepted the Terms of Service'),
                        value: checkedValue,
                        checkColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            checkedValue = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
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
                                        builder: (context) => const Login()),
                                  );
                                  setState(() {
                                    //empty now
                                  });
                                })))
                  ]),
            ),
          ),
        ));
  }

  void handleRadio(String? value) {
    print(value);
    setState(() {
      gender = value;
    });
  }
}
