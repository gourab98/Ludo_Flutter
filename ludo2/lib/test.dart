import 'package:flutter/material.dart';
import 'dart:math';

class TestRoration extends StatelessWidget {
  const TestRoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Testing(),
    );
  }
}

class Testing extends StatefulWidget {
  Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  AnimatedBuilder getRotation() {
    const double pi = 3.1415926535897932;
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(_controller.value * 30),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(500)),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                        //width: _controller.value * 10,
                      ),
                    ),
                    child: RotationTransition(
                      alignment: Alignment.center,
                      turns:
                          Tween(begin: 0.0, end: pi * 2).animate(_controller),
                      // child: Icon(
                      //   Icons.rotate_right,
                      //   size: 75,
                      //   color: Colors.green,
                      // ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(500)),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.blue,
                      ),
                    ),
                    child: Text(
                      "g1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();
    // _controller.addStatusListener((animationStatus) {
    //   switch (animationStatus) {
    //     case AnimationStatus.completed:
    //       _controller.reverse();
    //       //_controller.forward();
    //       break;
    //     case AnimationStatus.dismissed:
    //       _controller.forward();
    //       break;
    //     case AnimationStatus.forward:
    //       break;
    //     case AnimationStatus.reverse:
    //       break;
    //   }
    // });
    // _controller.forward();
    // super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Center(
        child: getRotation(),
      ),
    );
  }
}
