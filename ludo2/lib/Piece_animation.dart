import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ludo2/widgets/sound.dart';

// It is piece moving animation
class MovingPiece extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: AutoMove(),
    // );
    return Scaffold(
      body: AutoMove(),
    );
  }
}

class AutoMove extends StatefulWidget {
  const AutoMove({Key? key}) : super(key: key);

  @override
  _AutoMoveState createState() => _AutoMoveState();
}

class _AutoMoveState extends State<AutoMove> {
  var dice = Random();
  var allSound = Sound();
  int i = 0;
  List<int> a = [
    32,
    91,
    92,
    93,
    94,
    95,
    81,
    66,
    51,
    36,
    21,
    6,
    7,
    8,
    23,
    38,
    53,
    68,
    83,
    99,
    100,
    101,
    102,
    103,
    104,
    119,
    134,
    133,
    132,
    131,
    130,
    129,
    143,
    158,
    173,
    188,
    203,
    218,
    217,
    216,
    201,
    186,
    171,
    156,
    141,
    125,
    124,
    123,
    122,
    121,
    120,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
  ];

  int currentPosition = 32;

  double? boxWidth;
  final int crossAxisCount = 15;

  Offset getPosition(int index) {
    assert(boxWidth != null, "init boxWidth inside layoutBuilder");
    final dx = index <= crossAxisCount
        ? index * boxWidth!
        : (index % crossAxisCount) * boxWidth!;
    final dy = index <= crossAxisCount
        ? 0.0
        : (index / crossAxisCount).floor() * boxWidth!;
    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: LayoutBuilder(
            builder: (context, constraints) {
              boxWidth = constraints.maxWidth / crossAxisCount;
              return Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/Ludo_board.png"),
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  //   child: AspectRatio(
                  //     aspectRatio: 1,
                  //     child: GridView.count(
                  //       crossAxisCount: crossAxisCount,
                  //       children: [
                  //         ...List.generate(
                  //           225,
                  //           (index) => Container(
                  //             alignment: Alignment.center,
                  //             decoration: BoxDecoration(
                  //               border:
                  //                   Border.all(color: Colors.black, width: .5),
                  //             ),
                  //             child: Text("$index"),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    left: getPosition(currentPosition).dx,
                    top: getPosition(currentPosition).dy,
                    child: Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth / crossAxisCount,
                      height: constraints.maxWidth / crossAxisCount,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          if (i <= a.length) {
                            print(
                                'i = $i and the currentPosition= $currentPosition, ${a[i]}');
                            print('Dice------------------>$i');
                            //i = i + 1;
                            for (int j = 0; j < dice.nextInt(6) + 1; j++) {
                              await Future.delayed(
                                  const Duration(milliseconds: 350));
                              i++;
                              // allSound.pieceSound();
                              setState(() {
                                currentPosition = a[i];
                              });
                              allSound.pieceSound();
                            }
                            //i = dice.nextInt(6) + 1 + i;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   if (i <= a.length) {
      //     print('i = $i and the currentPosition= $currentPosition, ${a[i]}');
      //     print('Dice------------------>$i');
      //     //i = i + 1;
      //     for (int j = 0; j < dice.nextInt(6) + 1; j++) {
      //       await Future.delayed(const Duration(milliseconds: 350));
      //       i++;
      //       // allSound.pieceSound();
      //       setState(() {
      //         currentPosition = a[i];
      //       });
      //       allSound.pieceSound();
      //     }
      //     //i = dice.nextInt(6) + 1 + i;
      //   }
      // }),
    );
  }
}
