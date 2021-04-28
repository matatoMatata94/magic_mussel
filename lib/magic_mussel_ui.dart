import 'dart:math';

import 'package:flutter/material.dart';

class MagicMussel extends StatefulWidget {
  @override
  _MagicMusselState createState() => _MagicMusselState();
}

class _MagicMusselState extends State<MagicMussel> {
  final answers = [
    'I don\'t know',
    'That\'s a tough one',
    'ehm...',
    'You know it',
    'Just think about it',
    'That\'s so easy',
    'I have my own problems, you know?',
    '42',
    'The person you have called is not available'
  ];
  int answerNumber = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ask Me Anything')),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    answers[answerNumber],
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.lightBlue,
                ),
                // ClipPath(
                //   child: Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 100,
                //   ),
                //   clipper: MyCustomClipper(),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.lightBlueAccent,
                    minWidth: 200,
                    height: 50,
                    child: Text(
                      'Ask and Press',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        answerNumber = Random().nextInt(8) + 1;
                        print(answerNumber);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, 100);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
