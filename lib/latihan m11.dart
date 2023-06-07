import 'package:flutter/material.dart';

class LatihanM11 extends StatefulWidget {
  const LatihanM11({Key? key}) : super(key: key);
  @override
  State<LatihanM11> createState() => _LatihanM11State();
}

class _LatihanM11State extends State<LatihanM11> {
  List<Map<String, String>> users = [
    {
      "profile": "person1.jpg",
      "sender": "Kathy Lawrence",
      "message": "Hi, how are you?",
      "time": "17:30"
    },
    {
      "profile": "person2.jpg",
      "sender": "John Doe",
      "message": "Long time no see",
      "time": "15:45"
    },
    {
      "profile": "person3.jpg",
      "sender": "Patrick Sanchez",
      "message": "Wanna go bowling this weekend?",
      "time": "08:57"
    },
    {
      "profile": "person4.jpg",
      "sender": "Dwayne Johnson",
      "message": "It's about drive it's about power",
      "time": "10:00"
    },
    {
      "profile": "person5.jpg",
      "sender": "Stanley Owen",
      "message": "Your website is ready to launch sir",
      "time": "13:35"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        backgroundColor: Color(0xff128C7E),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              // Add menu items here
              PopupMenuItem(
                child: Text("New Group"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Linked Devices"),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Starred Messages"),
                value: 3,
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: 4,
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index]['sender']!),
            subtitle: Text(users[index]['message']!),
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/${users[index]['profile']}'),
            ),
            trailing: Text(users[index]['time']!),
          );
        },
      ),
    );
  }
}
