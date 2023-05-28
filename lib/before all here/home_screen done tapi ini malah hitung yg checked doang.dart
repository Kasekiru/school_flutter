import 'package:flutter/material.dart';
import 'todos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todos = [];
  void _toggleCategorySelection(int index, String category) {
    setState(() {
      if (_selectedChipIndex == index) {
        _selectedChipIndex = -1;
        _selectedCategory = null;
      } else {
        _selectedChipIndex = index;
        _selectedCategory = category;
      }
    });
  }

  void addTodo(String title, String description, String startDate,
      String endDate, String category) {
    setState(() {
      Map<String, dynamic> todo = {
        'title': title,
        'description': description,
        'category': category,
        'startDate': startDate,
        'endDate': endDate,
        'checked': false,
      };

      todos.add(todo);
    });
  }

  void removeTodoByIndex(int index) {
    setState(() {
      var todo = todos[index];
      var category = todo["category"];
      todos.removeAt(index);
      updateCategoryCount(
          category!, -1); // Decrease count for the removed todo category
    });
  }

  void updateCategoryCount(String category, int countChange) {
    var categoryCount = categoryCounts[category] ?? 0;
    categoryCount += countChange;
    categoryCounts[category] = categoryCount;
  }

  Map<String, int> categoryCounts = {
    'Routine': 0,
    'Work': 0,
    'Free': 0,
  };

  List<Map<String, dynamic>> getFilteredTodos() {
    if (_selectedCategory == null) {
      return todos;
    } else if (_selectedCategory == 'Routine') {
      return todos.where((todo) => todo["category"] == 'Routine').toList();
    } else {
      return todos
          .where((todo) => todo["category"] == _selectedCategory)
          .toList();
    }
  }

  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _selectedChipIndex = -1;
  String? _selectedCategory = null;
  bool isSwitched = false;
  bool? checked = false;
  Icon iconUtama = const Icon(Icons.wb_sunny);
  bool? darkValue = false;
  Color whiteText = Colors.black;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkValue == true
          ? const Color.fromARGB(255, 41, 41, 41)
          : Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text("Todo App", style: TextStyle(fontSize: 50)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text("By: Jimmy", style: TextStyle(fontSize: 15)),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text('Personal'),
              trailing: CircleAvatar(
                child: Text("${categoryCounts['Routine']}"),
              ),
            ),
            ListTile(
              title: Text('Work'),
              trailing: CircleAvatar(
                child: Text("${categoryCounts['Work']}"),
              ),
            ),
            ListTile(
              title: Text('Others'),
              trailing: CircleAvatar(
                child: Text("${categoryCounts['Free']}"),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isSwitched,
                onChanged: ((value) {
                  darkValue = value;
                  setState(() {
                    isSwitched = value;
                    whiteText = value ? Colors.white : Colors.black;
                    iconUtama = value
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.wb_sunny);
                  });
                }),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        backgroundColor: darkValue == true ? Colors.black : Colors.purple,
        actions: [
          iconUtama,
          Switch(
            value: isSwitched,
            onChanged: ((value) {
              darkValue = value;
              setState(() {
                isSwitched = value;
                whiteText = value ? Colors.white : Colors.black;
                iconUtama = value
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.wb_sunny);
              });
            }),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    color: _selectedChipIndex == 0 ? Colors.blue : Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _toggleCategorySelection(0, 'Routine');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Routine',
                        style: TextStyle(
                          color: _selectedChipIndex == 0
                              ? Colors.white
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    color: _selectedChipIndex == 1 ? Colors.red : Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _toggleCategorySelection(1, 'Work');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Work',
                        style: TextStyle(
                          color: _selectedChipIndex == 1
                              ? Colors.white
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    color:
                        _selectedChipIndex == 2 ? Colors.yellow : Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _toggleCategorySelection(2, 'Free');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Free',
                        style: TextStyle(
                          color: _selectedChipIndex == 2
                              ? Colors.white
                              : Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredTodos().length,
              itemBuilder: (context, index) {
                var todo = getFilteredTodos()[index];
                return ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                  collapsedBackgroundColor: Colors.grey[300],
                  backgroundColor: Colors.grey[100],
                  title: ListTile(
                    leading: Checkbox(
                      checkColor: whiteText,
                      value: todo['checked'] as bool,
                      onChanged: (val) {
                        setState(() {
                          todo['checked'] = val;
                          if (val == true) {
                            categoryCounts[todo['category'] as String] =
                                (categoryCounts[todo['category'] as String] ??
                                        0) +
                                    1;
                          } else {
                            categoryCounts[todo['category'] as String] =
                                (categoryCounts[todo['category'] as String] ??
                                        0) -
                                    1;
                          }
                        });
                      },
                    ),
                    title: Text(
                      todo["title"]!,
                      style: TextStyle(
                        color: darkValue == true
                            ? const Color.fromARGB(255, 41, 41, 41)
                            : Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      todo["description"]!,
                      style: TextStyle(
                        color: darkValue == true
                            ? const Color.fromARGB(255, 41, 41, 41)
                            : Colors.white,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Text(
                            todo["category"]!,
                            style: TextStyle(
                              color: whiteText,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Text(
                          '${todo["startDate"]!} s/d',
                          style: TextStyle(
                            color: whiteText,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '${todo["endDate"]!} s/d',
                          style: TextStyle(
                            color: whiteText,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: [Text("helloo")],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkValue == true ? Colors.black : Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: whiteText,
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
