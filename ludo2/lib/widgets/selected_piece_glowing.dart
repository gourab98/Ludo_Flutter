import 'package:flutter/material.dart';

//File is changed.
// This class is for glowing piece(Glowing effect comes from enhancing the broder of the piece container)
class Glowing extends StatelessWidget {
  final double pieceSize;
  final Color color;
  const Glowing({
    Key? key,
    required this.pieceSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Test(
        pieceSize: pieceSize,
        color: color,
      ),
    );
  }
}

class Test extends StatefulWidget {
  final double pieceSize;
  final Color color;
  Test({required this.pieceSize, required this.color});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  late AnimationController _resizableController;

  AnimatedBuilder getContainer() {
    return new AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            height: widget.pieceSize,
            width: widget.pieceSize,
            padding: EdgeInsets.all(6),
            //child: Text(" "),
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(500)),
              border: Border.all(
                  color: Colors.amber, width: _resizableController.value * 20),
            ),
          );
        });
  }

  @override
  void initState() {
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, body: Center(child: getContainer()));
  }
}
