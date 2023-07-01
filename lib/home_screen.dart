import 'dart:html';

import 'package:flutter/material.dart';
import 'todos.dart';
import 'calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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

  List<Map<String, dynamic>> getNotFinishedTodos() {
    if (_selectedCategory == null) {
      return todos.where((todo) => !(todo['checked'] as bool)).toList();
    } else {
      return todos
          .where((todo) =>
              todo['category'] == _selectedCategory &&
              !(todo['checked'] as bool))
          .toList();
    }
  }

  int getFinishedTodosCount(String category) {
    if (_selectedCategory == null) {
      return todos
          .where(
              (todo) => todo['category'] == category && todo['checked'] as bool)
          .toList()
          .length;
    } else {
      return todos
          .where((todo) =>
              todo['category'] == _selectedCategory && todo['checked'] as bool)
          .toList()
          .length;
    }
  }

  int getTotalnotFinishedTodosCount() {
    int totalCount = 0;
    totalCount = todos.length;
    return totalCount;
  }

  int getTotalFinishedTodosCount() {
    int totalCount = 0;
    List<String> categories = ['Routine', 'Work', 'Free'];
    for (String category in categories) {
      totalCount += getFinishedTodosCount(category);
    }
    return totalCount;
  }

  List<Map<String, dynamic>> getFinishedTodos() {
    if (_selectedCategory == null) {
      return todos.where((todo) => todo['checked'] as bool).toList();
    } else {
      return todos
          .where((todo) =>
              todo['category'] == _selectedCategory &&
              (todo['checked'] as bool))
          .toList();
    }
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
      updateCategoryCount(category);
    });
  }

  Map<String, int> categoryCounts = {
    'Routine': 0,
    'Work': 0,
    'Free': 0,
  };

  void removeTodoByIndex(int index) {
    setState(() {
      var todo = todos[index];
      var category = todo["category"];
      todos.removeAt(index);
      updateCategoryCount(category);
    });
  }

  void updateCategoryCount(String category) {
    int uncheckedCount = todos
        .where((todo) => todo['category'] == category && !todo['checked'])
        .length;
    categoryCounts[category] = uncheckedCount;
  }

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

  textnya() {
    String allDone = "All Task Done";
    int angka = getTotalnotFinishedTodosCount() - getTotalFinishedTodosCount();
    String mantap = "${angka}";
    String teks = "You Still have ${mantap} Task left";
    if (getTotalFinishedTodosCount() == getTotalnotFinishedTodosCount()) {
      return allDone;
    } else {
      return teks;
    }
  }

  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void toggleTodoCheckedStatus(int index, bool checked) {
    setState(() {
      var todo = todos[index];
      var category = todo["category"];
      todo['checked'] = checked;
      updateCategoryCount(category);
    });
  }

  bool isFABVisible = true;

  void toggleFABVisibility() {
    setState(() {
      isFABVisible = !isFABVisible;
    });
  }

  int _selectedChipIndex = -1;
  String? _selectedCategory = null;
  bool isSwitched = false;
  bool? checked = false;
  Icon iconUtama = const Icon(Icons.wb_sunny);
  bool darkValue = false;
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
              title: Text('Routine'),
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
              title: Text('Free'),
              trailing: CircleAvatar(
                child: Text("${categoryCounts['Free']}"),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  darkValue = value;
                  setState(() {
                    isSwitched = value;
                    whiteText = value ? Colors.white : Colors.black;
                    iconUtama = value
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.wb_sunny);
                  });
                },
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
            onChanged: (value) {
              darkValue = value;
              setState(() {
                isSwitched = value;
                whiteText = value ? Colors.white : Colors.black;
                iconUtama = value
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.wb_sunny);
              });
            },
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            _selectedChipIndex == 0 ? Colors.blue : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      color:
                          _selectedChipIndex == 0 ? Colors.blue : Colors.white,
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
                        color:
                            _selectedChipIndex == 1 ? Colors.red : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      color:
                          _selectedChipIndex == 1 ? Colors.red : Colors.white,
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
                        color: _selectedChipIndex == 2
                            ? Colors.yellow
                            : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      color: _selectedChipIndex == 2
                          ? Colors.yellow
                          : Colors.white,
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
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Text("Not Finished"),
                  Divider(),
                ],
              ),
            ),
            if (todos.isNotEmpty) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: getNotFinishedTodos().length,
                  itemBuilder: (context, index) {
                    var todo = getNotFinishedTodos()[index];
                    return ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      collapsedBackgroundColor: Colors.grey[300],
                      backgroundColor: Colors.grey[100],
                      title: ListTile(
                        leading: Checkbox(
                          checkColor: whiteText,
                          value: todo['checked'] as bool,
                          onChanged: (val) {
                            setState(() {
                              var category = todo['category'] as String;
                              if (val == true) {
                                todo['checked'] = true;
                                categoryCounts[category] =
                                    (categoryCounts[category] ?? 0) - 1;
                              } else {
                                todo['checked'] = false;
                                categoryCounts[category] =
                                    (categoryCounts[category] ?? 0) + 1;
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
                      children: [Text("")],
                    );
                  },
                ),
              ),
            ],
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Text("Finished"),
                  Divider(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getFinishedTodos().length,
                itemBuilder: (context, index) {
                  var todo = getFinishedTodos()[index];
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
                            var category = todo['category'] as String;
                            if (val == true) {
                              todo['checked'] = true;
                              categoryCounts[category] =
                                  (categoryCounts[category] ?? 0) - 1;
                            } else {
                              todo['checked'] = false;
                              categoryCounts[category] =
                                  (categoryCounts[category] ?? 0) + 1;
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
          ]),
          CalendarPage(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text("Jimmy"),
                    subtitle:
                        Text("Task Finished: ${getTotalFinishedTodosCount()}"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Center(child: Text("Routine")),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "${getFinishedTodosCount('Routine')}",
                              style:
                                  TextStyle(fontSize: 36, color: Colors.orange),
                            )),
                            SizedBox(height: 4),
                            Center(child: Text("Finished")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Center(child: Text("Work")),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "${getFinishedTodosCount('Work')}",
                              style:
                                  TextStyle(fontSize: 36, color: Colors.blue),
                            )),
                            SizedBox(height: 4),
                            Center(child: Text("Finished")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Center(child: Text("Free")),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "${getFinishedTodosCount('Free')}",
                              style:
                                  TextStyle(fontSize: 36, color: Colors.green),
                            )),
                            SizedBox(height: 4),
                            Center(child: Text("Finished")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: 3,
                    child: Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SliderTheme(
                              data: SliderThemeData(
                                thumbShape: RoundSliderThumbShape(
                                    disabledThumbRadius: 0),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 0),
                                disabledActiveTrackColor: Colors.orange,
                                disabledInactiveTickMarkColor: null,
                              ),
                              child: Slider(
                                value: getTotalFinishedTodosCount().toDouble(),
                                onChanged: null,
                                max: getTotalnotFinishedTodosCount().toDouble(),
                              ),
                            ),
                            Text("${textnya()}")
                          ],
                        ),
                      ),
                    )),
              )
            ],
          )
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
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
      floatingActionButton: _currentIndex != 1 && isFABVisible
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Todos(
                              onSaveTodo: addTodo,
                              dark: darkValue,
                            )));
              },
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
