// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('My Mood'),
          backgroundColor: Colors.black26,
        ),
        body: MyMoodPage(),
      ),
    );
  }
}

class MyMoodPage extends StatefulWidget {
  const MyMoodPage({Key? key}) : super(key: key);

  @override
  State<MyMoodPage> createState() => _MyMoodPageState();
}

class _MyMoodPageState extends State<MyMoodPage> {
  var myMood = ['angry', 'happy', 'laughing', 'romantic', 'sad'];
  var myCurrentMood = 'angry';

  void predictMyMood() {
    final _random = new Random();

    var element = myMood[_random.nextInt(myMood.length)];

    setState(() {
      myCurrentMood = element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset("images/$myCurrentMood.png"),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black26,
            ),
            child: Text('Predict My Mood'),
            onPressed: () {
              predictMyMood();
            },
          ),
        ),
      ],
    );
  }
}
