import 'package:flutter/material.dart';

class LatihanM12 extends StatelessWidget {
  LatihanM12({Key? key}) : super(key: key);

  final List<Map<String, String>> data = [
    {
      "uname": "sarah_johnson",
      "misc": "Canada",
      "profile": "person1.jpg",
      "post": "snow.png",
      "desc": "just go to the beautiful country yesterday",
      "likes": "10"
    },
    {
      "uname": "bernie123",
      "misc": "Canada",
      "profile": "person2.jpg",
      "post": "mantap.png",
      "desc": "Person above me just took my picture",
      "likes": "120"
    },
    {
      "uname": "thomas_ad",
      "misc": "Canada",
      "profile": "person3.jpg",
      "post": "adaa.png",
      "desc": "Don't trust that both person, they all took my picture",
      "likes": "140"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: data.map((item) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/${item['profile']}"),
                    ),
                    title: Text(
                      item['uname']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item['misc']!),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/${item['post']}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite_border),
                            SizedBox(width: 10),
                            Icon(Icons.comment),
                            SizedBox(width: 10),
                            Icon(Icons.send),
                          ],
                        ),
                        Icon(Icons.bookmark_outline_sharp),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("${item['likes']} likes"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: item['uname']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " ${item['desc']}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
