import 'package:flutter/material.dart';
// This class is for piece glowing effect(Glowing effect comes from a border effect that enlarge in forward manner.)

class TestRotation extends StatelessWidget {
  final double pieceSize;
  final Color color;
  const TestRotation({
    Key? key,
    required this.pieceSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Testing(
          pieceSize: pieceSize,
          color: color,
        ),
      ),
    );
  }
}

class Testing extends StatefulWidget {
  final double pieceSize;
  final Color color;
  Testing({
    Key? key,
    required this.pieceSize,
    required this.color,
  }) : super(key: key);

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
                    padding: EdgeInsets.all(
                        _controller.value * (widget.pieceSize * 1.25)),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(500)),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.white,
                        //width: _controller.value * 2,
                      ),
                    ),
                    child: RotationTransition(
                      alignment: Alignment.center,
                      turns:
                          Tween(begin: 0.0, end: pi * 2).animate(_controller),
                      // child: Icon(
                      //   Icons.rotate_right,
                      //   size: widget.pieceSize / 2,
                      //   color: Colors.green,
                      // ),
                      // child: Container(
                      //   height: (widget.pieceSize / 2) + 5,
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: (widget.pieceSize) / 2,
                    width: (widget.pieceSize) / 2,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(500)),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "G1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
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
      duration: const Duration(milliseconds: 1000),
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
    return Container(
      height: widget.pieceSize * 2,
      width: widget.pieceSize * 2,
      child: getRotation(),
    );
  }
}
