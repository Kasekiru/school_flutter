import 'dart:async';
import 'package:flutter/material.dart';

class LatihanM13 extends StatefulWidget {
  const LatihanM13({Key? key}) : super(key: key);

  @override
  State<LatihanM13> createState() => _LatihanM13State();
}

class _LatihanM13State extends State<LatihanM13> {
  double sliderValue = 0;
  Timer? timer;
  final double maxSliderValue = 285; // Adjust the maximum slider value here
  bool isPlaying = true; // Flag to track whether the music is playing or paused

  @override
  void initState() {
    startTimer(); // Start the timer when the widget is initialized
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (sliderValue < maxSliderValue) {
          sliderValue++;
        } else {
          // Reset the slider value to 0 and start again
          sliderValue = 0;
        }
      });
    });
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void playTimer() {
    startTimer();
  }

  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        pauseTimer();
      } else {
        playTimer();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = (sliderValue / 60).floor();
    final int seconds = (sliderValue % 60).floor();

    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 252, 174, 174), // Set your desired background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300, // Set the desired width of the image
              height: 300, // Set the desired height of the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "images/cat.png"), // Set the path to your desired image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Sad Song", // Set your desired song title
              style: TextStyle(
                color: Colors.black, // Set your desired text color
                fontSize: 24, // Set your desired font size
              ),
            ),
            SizedBox(height: 10),
            Text(
              "wumbo", // Set your desired artist name
              style: TextStyle(
                color: Colors.black, // Set your desired text color
                fontSize: 18, // Set your desired font size
              ),
            ),
            SizedBox(height: 30),
            Slider(
              value: sliderValue,
              min: 0,
              max: maxSliderValue,
              activeColor: Colors.blue, // Set your desired active color
              inactiveColor: Colors.grey, // Set your desired inactive color
              onChanged: (val) {
                setState(() {
                  sliderValue = val.roundToDouble();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}", // Set the current playing duration
                    style: TextStyle(
                      color: Colors.black, // Set your desired text color
                      fontSize: 16, // Set your desired font size
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    "4:45", // Set the total duration of the song
                    style: TextStyle(
                      color: Colors.black, // Set your desired text color
                      fontSize: 16, // Set your desired font size
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.favorite,
                    color: Colors.red), // Set your desired icon color
                Icon(Icons.skip_previous,
                    color: Colors.black,
                    size: 36), // Set your desired icon color and size
                InkWell(
                  onTap:
                      togglePlayPause, // Toggle play/pause when the button is tapped
                  child: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.black,
                    size: 60,
                  ),
                ),
                Icon(Icons.skip_next,
                    color: Colors.black,
                    size: 36), // Set your desired icon color and size
                Icon(Icons.shuffle,
                    color: Colors.black), // Set your desired icon color
              ],
            )
          ],
        ),
      ),
    );
  }
}
