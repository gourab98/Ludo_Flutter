import 'package:flutter/material.dart';
import 'package:ludo2/Piece_animation.dart';
import 'package:ludo2/screens/home_screen.dart';
import 'package:ludo2/test/animation_demo.dart';
import 'package:ludo2/widgets/selected_piece_glowing.dart';
import 'package:ludo2/widgets/white_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Main Class:
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Home Page'),
      // home: Container(
      //   child: TestRotation(color: Colors.blue, pieceSize: 50),
      //   color: Colors.green,
      // ),
      //home: Test(pieceSize: 50, color: Colors.blue),
      //home: MovingPiece(),
      //home: Piece(),
      //home: MovingPiece(),
    );
  }
}
