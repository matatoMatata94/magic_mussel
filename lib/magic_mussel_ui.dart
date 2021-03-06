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
    'Good question'
    'You know it',
    'Just think about it',
    'That\'s so easy',
    '42',
  ];
  int answerNumber = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          answers[answerNumber],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.lightBlue,
                  ),
                ),
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
                        answerNumber = Random().nextInt(6) + 1;
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

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
