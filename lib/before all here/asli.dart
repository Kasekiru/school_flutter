import 'dart:math';
import 'login.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Status(title: "Normal User"),
      child: MyApp(),
    ),
  );
}

class Status with ChangeNotifier {
  Status({required this.title});

  String title;

  void buyPremium() {
    title = "Premium User";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(title: 'NewZ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _thisNumber = 0;

  void _increase() {
    setState(() {
      _thisNumber++;
    });
  }

  void _decrease() {
    setState(() {
      _thisNumber--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 65,
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset(
            'images/logo.png',
            height: 30,
            width: 30,
          ),
          SizedBox(width: 10),
          Text(style: TextStyle(fontWeight: FontWeight.bold), widget.title),
        ]),
        leading: Container(
          color: Colors.amber,
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
          ),
        ),
        actions: [
          Text('''
          ${Provider.of<Status>(context).title}
          ''')
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'images/railways.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'images/politics.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'images/torii.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                viewportFraction: 0.6,
              )),
          SizedBox(
            height: 30,
          ),
          Column(children: [
            Image.asset(
              'images/pavlova.jpg',
              width: 500,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            InputChip(
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1535141192574-5d4897c12636?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"),
                ),
                label: Text("Cake"),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register())),
                    }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 450,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 3,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              children: [
                if (_thisNumber % 2 == 0) ...[
                  Container(color: Colors.yellow),
                  Container(color: Colors.orange),
                  Container(color: Colors.blue),
                ],
                if (_thisNumber % 2 != 0) ...[
                  Container(color: Colors.red),
                  Container(color: Colors.pink),
                  Container(color: Colors.purple),
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 100,
                  color: Colors.blue,
                  child: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: _decrease,
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  minWidth: 100,
                  color: Colors.blue,
                  child: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: _increase,
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 30,
              color: Colors.amberAccent,
              child: Text(
                'NineTentacles.Inc',
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ],
      ),
    );
  }
}

//