import 'package:flutter/material.dart';

import 'todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void onSaveTodo(String title, String description, String startDate,
      String endDate, String category, BuildContext context) {
    final homePageState = context.findAncestorStateOfType<_MyHomePageState>();
    homePageState?.addTodo(title, description, startDate, endDate, category);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Todos'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [];

  void addTodo(String title, String description, String startDate,
      String endDate, String category) {
    setState(() {
      todos.add(Todo(
          title: title,
          description: description,
          startDate: startDate,
          endDate: endDate,
          category: category));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                  child: Text(
                    todo.category,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '${todo.startDate} s/d',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  '${todo.endDate} s/d',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Todos(onSaveTodo: addTodo))));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String category;

  Todo(
      {required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.category});
}
