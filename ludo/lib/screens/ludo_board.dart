import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:ludo/widgets/anti_tile.dart';
import 'package:ludo/widgets/board_quarter_color.dart';
import 'package:ludo/widgets/cell_color_on_board.dart';
import 'package:ludo/widgets/glowing_side.dart';
import 'dart:math';

import 'package:ludo/widgets/ludo_piece.dart';
import 'package:ludo/widgets/ludo_quarter_painter.dart';
import 'package:ludo/widgets/tile.dart';

class LudoBoard extends StatefulWidget {
  final String colorName;
  final String playerName;

  const LudoBoard({
    required this.colorName,
    required this.playerName,
  });

  @override
  _LudoBoardState createState() => _LudoBoardState();
}

class _LudoBoardState extends State<LudoBoard> {
  var dice = Random();
  int number = 0;
  int flag = 0;
  int threeSix = 0;
  String diceValuePrint = "Nothing";
  Color color = Colors.green;
  var pieceSound = AudioCache();

  // All Pieces Value:
  Map<String, bool> greenPiece = {
    'g1': false,
    'g2': false,
    'g3': false,
    'g4': false
  };
  Map<String, bool> yellowPiece = {
    'y1': false,
    'y2': false,
    'y3': false,
    'y4': false
  };
  Map<String, bool> bluePiece = {
    'b1': false,
    'b2': false,
    'b3': false,
    'b4': false
  };
  Map<String, bool> redPiece = {
    'r1': false,
    'r2': false,
    'r3': false,
    'r4': false
  };

  Map<int, List<List<int>>> greenPath = {
    1: [
      [6, 1]
    ],
    2: [
      [6, 2]
    ],
    3: [
      [6, 3]
    ],
    4: [
      [6, 4]
    ],
    5: [
      [6, 5]
    ],
    6: [
      [5, 6]
    ],
    7: [
      [4, 6]
    ],
    8: [
      [3, 6]
    ],
    9: [
      [2, 6]
    ],
    10: [
      [1, 6]
    ],
    11: [
      [0, 6]
    ],
    12: [
      [0, 7]
    ],
    13: [
      [0, 8]
    ],
    14: [
      [1, 8]
    ],
    15: [
      [2, 8]
    ],
    16: [
      [3, 8]
    ],
    17: [
      [4, 8]
    ],
    18: [
      [5, 8]
    ],
    19: [
      [6, 9]
    ],
    20: [
      [6, 10]
    ],
    21: [
      [6, 11]
    ],
    22: [
      [6, 12]
    ],
    23: [
      [6, 13]
    ],
    24: [
      [6, 14]
    ],
    25: [
      [7, 14]
    ],
    26: [
      [8, 14]
    ],
    27: [
      [8, 13]
    ],
    28: [
      [8, 12]
    ],
    29: [
      [8, 11]
    ],
    30: [
      [8, 10]
    ],
    31: [
      [8, 9]
    ],
    32: [
      [9, 8]
    ],
    33: [
      [10, 8]
    ],
    34: [
      [11, 8]
    ],
    35: [
      [12, 8]
    ],
    36: [
      [13, 8]
    ],
    37: [
      [14, 8]
    ],
    38: [
      [14, 7]
    ],
    39: [
      [14, 6]
    ],
    40: [
      [13, 6]
    ],
    41: [
      [12, 6]
    ],
    42: [
      [11, 6]
    ],
    43: [
      [10, 6]
    ],
    44: [
      [9, 6]
    ],
    45: [
      [8, 5]
    ],
    46: [
      [8, 4]
    ],
    47: [
      [8, 3]
    ],
    48: [
      [8, 2]
    ],
    49: [
      [8, 1]
    ],
    50: [
      [8, 0]
    ],
    51: [
      [7, 0]
    ],
    52: [
      [7, 1]
    ],
    53: [
      [7, 2]
    ],
    54: [
      [7, 3]
    ],
    55: [
      [7, 4]
    ],
    56: [
      [7, 5]
    ],
    57: [
      [7, 6]
    ]
  };

  Map<int, List<List<int>>> yellowPath = {
    1: [
      [1, 8]
    ],
    2: [
      [2, 8]
    ],
    3: [
      [3, 8]
    ],
    4: [
      [4, 8]
    ],
    5: [
      [5, 8]
    ],
    6: [
      [6, 9]
    ],
    7: [
      [6, 10]
    ],
    8: [
      [6, 11]
    ],
    9: [
      [6, 12]
    ],
    10: [
      [6, 13]
    ],
    11: [
      [6, 14]
    ],
    12: [
      [7, 14]
    ],
    13: [
      [8, 14]
    ],
    14: [
      [8, 13]
    ],
    15: [
      [8, 12]
    ],
    16: [
      [8, 11]
    ],
    17: [
      [8, 10]
    ],
    18: [
      [8, 9]
    ],
    19: [
      [9, 8]
    ],
    20: [
      [10, 8]
    ],
    21: [
      [11, 8]
    ],
    22: [
      [12, 8]
    ],
    23: [
      [13, 8]
    ],
    24: [
      [14, 8]
    ],
    25: [
      [14, 7]
    ],
    26: [
      [14, 6]
    ],
    27: [
      [13, 6]
    ],
    28: [
      [12, 6]
    ],
    29: [
      [11, 6]
    ],
    30: [
      [10, 6]
    ],
    31: [
      [9, 6]
    ],
    32: [
      [8, 5]
    ],
    33: [
      [8, 4]
    ],
    34: [
      [8, 3]
    ],
    35: [
      [8, 2]
    ],
    36: [
      [8, 1]
    ],
    37: [
      [8, 0]
    ],
    38: [
      [7, 0]
    ],
    39: [
      [6, 0]
    ],
    40: [
      [6, 1]
    ],
    41: [
      [6, 2]
    ],
    42: [
      [6, 3]
    ],
    43: [
      [6, 4]
    ],
    44: [
      [6, 5]
    ],
    45: [
      [5, 6]
    ],
    46: [
      [4, 6]
    ],
    47: [
      [3, 6]
    ],
    48: [
      [2, 6]
    ],
    49: [
      [1, 6]
    ],
    50: [
      [0, 6]
    ],
    51: [
      [0, 7]
    ],
    52: [
      [1, 7]
    ],
    53: [
      [2, 7]
    ],
    54: [
      [3, 7]
    ],
    55: [
      [4, 7]
    ],
    56: [
      [5, 7]
    ],
    57: [
      [6, 7]
    ]
  };

  Map<int, List<List<int>>> bluePath = {
    1: [
      [8, 13]
    ],
    2: [
      [8, 12]
    ],
    3: [
      [8, 11]
    ],
    4: [
      [8, 10]
    ],
    5: [
      [8, 9]
    ],
    6: [
      [9, 8]
    ],
    7: [
      [10, 8]
    ],
    8: [
      [11, 8]
    ],
    9: [
      [12, 8]
    ],
    10: [
      [13, 8]
    ],
    11: [
      [14, 8]
    ],
    12: [
      [14, 7]
    ],
    13: [
      [14, 6]
    ],
    14: [
      [13, 6]
    ],
    15: [
      [12, 6]
    ],
    16: [
      [11, 6]
    ],
    17: [
      [10, 6]
    ],
    18: [
      [9, 6]
    ],
    19: [
      [8, 5]
    ],
    20: [
      [8, 4]
    ],
    21: [
      [8, 3]
    ],
    22: [
      [8, 2]
    ],
    23: [
      [8, 1]
    ],
    24: [
      [8, 0]
    ],
    25: [
      [7, 0]
    ],
    26: [
      [6, 0]
    ],
    27: [
      [6, 1]
    ],
    28: [
      [6, 2]
    ],
    29: [
      [6, 3]
    ],
    30: [
      [6, 4]
    ],
    31: [
      [6, 5]
    ],
    32: [
      [5, 6]
    ],
    33: [
      [4, 6]
    ],
    34: [
      [3, 6]
    ],
    35: [
      [2, 6]
    ],
    36: [
      [1, 6]
    ],
    37: [
      [0, 6]
    ],
    38: [
      [0, 7]
    ],
    39: [
      [0, 8]
    ],
    40: [
      [1, 8]
    ],
    41: [
      [2, 8]
    ],
    42: [
      [3, 8]
    ],
    43: [
      [4, 8]
    ],
    44: [
      [5, 8]
    ],
    45: [
      [6, 9]
    ],
    46: [
      [6, 10]
    ],
    47: [
      [6, 11]
    ],
    48: [
      [6, 12]
    ],
    49: [
      [6, 13]
    ],
    50: [
      [6, 14]
    ],
    51: [
      [7, 14]
    ],
    52: [
      [7, 13]
    ],
    53: [
      [7, 12]
    ],
    54: [
      [7, 11]
    ],
    55: [
      [7, 10]
    ],
    56: [
      [7, 9]
    ],
    57: [
      [7, 8]
    ]
  };

  Map<int, List<List<int>>> redPath = {
    1: [
      [13, 6]
    ],
    2: [
      [12, 6]
    ],
    3: [
      [11, 6]
    ],
    4: [
      [10, 6]
    ],
    5: [
      [9, 6]
    ],
    6: [
      [8, 5]
    ],
    7: [
      [8, 4]
    ],
    8: [
      [8, 3]
    ],
    9: [
      [8, 2]
    ],
    10: [
      [8, 1]
    ],
    11: [
      [8, 0]
    ],
    12: [
      [7, 0]
    ],
    13: [
      [6, 0]
    ],
    14: [
      [6, 1]
    ],
    15: [
      [6, 2]
    ],
    16: [
      [6, 3]
    ],
    17: [
      [6, 4]
    ],
    18: [
      [6, 5]
    ],
    19: [
      [5, 6]
    ],
    20: [
      [4, 6]
    ],
    21: [
      [3, 6]
    ],
    22: [
      [2, 6]
    ],
    23: [
      [1, 6]
    ],
    24: [
      [0, 6]
    ],
    25: [
      [0, 7]
    ],
    26: [
      [0, 8]
    ],
    27: [
      [1, 8]
    ],
    28: [
      [2, 8]
    ],
    29: [
      [3, 8]
    ],
    30: [
      [4, 8]
    ],
    31: [
      [5, 8]
    ],
    32: [
      [6, 9]
    ],
    33: [
      [6, 10]
    ],
    34: [
      [6, 11]
    ],
    35: [
      [6, 12]
    ],
    36: [
      [6, 13]
    ],
    37: [
      [6, 14]
    ],
    38: [
      [7, 14]
    ],
    39: [
      [8, 14]
    ],
    40: [
      [8, 13]
    ],
    41: [
      [8, 12]
    ],
    42: [
      [8, 11]
    ],
    43: [
      [8, 10]
    ],
    44: [
      [8, 9]
    ],
    45: [
      [9, 8]
    ],
    46: [
      [10, 8]
    ],
    47: [
      [11, 8]
    ],
    48: [
      [12, 8]
    ],
    49: [
      [13, 8]
    ],
    50: [
      [14, 8]
    ],
    51: [
      [14, 7]
    ],
    52: [
      [13, 7]
    ],
    53: [
      [12, 7]
    ],
    54: [
      [11, 7]
    ],
    55: [
      [10, 7]
    ],
    56: [
      [9, 7]
    ],
    57: [
      [8, 7]
    ]
  };

  // Each Color decoration list:
  List greenCellColorOnBoard = [91, 106, 107, 108, 109, 110];
  List yellowCellColorOnBoard = [23, 22, 37, 52, 67, 82];
  List blueCellColorOnBoard = [133, 118, 117, 116, 115, 114];
  List redCellColorOnBoard = [201, 202, 187, 172, 157, 142];
  // Final Cell List:
  List finalCellColorOnBoard = [96, 97, 98, 111, 112, 113, 126, 127, 128];
  // All Four(4) Stars List:
  List allStar = [91, 23, 133, 201];
  //Board Colors per quarter:
  List greenBoard = [
    0,
    1,
    2,
    3,
    4,
    5,
    15,
    17,
    18,
    20,
    30,
    31,
    32,
    33,
    34,
    35,
    45,
    46,
    47,
    48,
    49,
    50,
    60,
    62,
    63,
    65,
    75,
    76,
    77,
    78,
    79,
    80
  ];

  List yellowBoard = [
    9,
    10,
    11,
    12,
    13,
    14,
    24,
    25,
    26,
    27,
    28,
    29,
    39,
    40,
    41,
    42,
    43,
    44,
    54,
    55,
    56,
    57,
    58,
    59,
    69,
    70,
    71,
    72,
    73,
    74,
    84,
    85,
    86,
    87,
    87,
    88,
    89
  ];
  List blueBoard = [
    144,
    145,
    146,
    147,
    148,
    149,
    159,
    160,
    161,
    162,
    163,
    164,
    174,
    175,
    176,
    177,
    178,
    179,
    189,
    190,
    191,
    192,
    193,
    194,
    204,
    205,
    206,
    207,
    208,
    209,
    219,
    220,
    221,
    222,
    223,
    224
  ];
  List redBoard = [
    135,
    136,
    137,
    138,
    139,
    140,
    150,
    151,
    152,
    153,
    154,
    155,
    165,
    166,
    167,
    168,
    169,
    170,
    180,
    181,
    182,
    183,
    184,
    185,
    195,
    196,
    197,
    198,
    199,
    200,
    210,
    211,
    212,
    213,
    214,
    215
  ];

  //Green Pieces:
  int g1 = 1;
  int g11 = 1;
  int g1Clear = 0;
  int g2 = 2;
  int g2Clear = 0;
  int g3 = 3;
  int g3Clear = 0;
  int g4 = 4;
  int g4Clear = 0;

  // Rest of the pieces:
  int y1 = 0;
  int b1 = 0;
  int r1 = 0;

  // All  Pieces Path:
  List greenPiecePath = [
    112,
    16,
    19,
    61,
    64,
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
  List yellowPiecePath = [
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
    90,
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
    22,
    37,
    52,
    67,
    82,
    97
  ];
  List bluePiecePath = [
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
    90,
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
    118,
    117,
    116,
    115,
    114,
    113,
  ];
  List redPiecePath = [
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
    90,
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
    202,
    187,
    172,
    157,
    142,
    127,
  ];
  List allPathWithOutStar = [
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
    90,
  ];
  List indexing = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.colorName}  ${widget.playerName}"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) {
                double sizeHeight = constraints.maxHeight;
                double sizeWeight = constraints.maxWidth;
                Size size = Size(sizeHeight, sizeWeight);
                double boardSize = size.height;
                double pieceSize = size.height / 15;

                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GridView.count(
                        crossAxisCount: 15,
                        childAspectRatio: 1,
                        children: List<Widget>.generate(
                          225,
                          (index) {
                            return Stack(
                              fit: StackFit.passthrough,
                              children: [
                                GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.black),
                                    ),
                                  ),
                                ),

                                //Board Color
                                BoardQuarterColor(
                                    CellColorOnBoard: greenBoard,
                                    color: Colors.green.shade900,
                                    index: index),
                                BoardQuarterColor(
                                    CellColorOnBoard: yellowBoard,
                                    color: Colors.yellow.shade900,
                                    index: index),
                                BoardQuarterColor(
                                    CellColorOnBoard: blueBoard,
                                    color: Colors.blue.shade900,
                                    index: index),
                                BoardQuarterColor(
                                    CellColorOnBoard: redBoard,
                                    color: Colors.red.shade900,
                                    index: index),
                                // Making  color on the board like individual green cell color:
                                CellColorOnBoard(
                                    CellColorOnBoard: greenCellColorOnBoard,
                                    color: Colors.green.shade200,
                                    index: index),
                                CellColorOnBoard(
                                    CellColorOnBoard: yellowCellColorOnBoard,
                                    color: Colors.yellow.shade200,
                                    index: index),
                                CellColorOnBoard(
                                    CellColorOnBoard: blueCellColorOnBoard,
                                    color: Colors.blue.shade200,
                                    index: index),
                                CellColorOnBoard(
                                    CellColorOnBoard: redCellColorOnBoard,
                                    color: Colors.red.shade200,
                                    index: index),
                                CellColorOnBoard(
                                    CellColorOnBoard: finalCellColorOnBoard,
                                    color: Colors.indigo.shade200,
                                    index: index),

                                // Green g1
                                if (greenPiece['g1'] == true)
                                  Center(
                                    child: Tile(
                                      pieceName: 'g1',
                                      diceValue: number,
                                      index: index,
                                      color: Colors.green,
                                      pieceSize: pieceSize,
                                      accessedCell: greenPiecePath[g1],
                                      child: GestureDetector(
                                        //                                        behavior: HitTestBehavior.translucent,
                                        onTap: () async {
                                          print("'g1' is pressed $g1");
                                          // setState(() async {
                                          if (g1 == 1) {
                                            g1 = 5;
                                            g1Clear = 1;
                                          } else if (g1 + number <= 61) {
                                            //g1Clear = g1;
                                            // var future = Future.delayed(
                                            //     Duration(milliseconds: 1000),
                                            //     () {
                                            for (int i = 0; i < number; i++) {
                                              await Future.delayed(
                                                  Duration(milliseconds: 300));
                                              setState(() {
                                                g1Clear = g1;
                                                g1 = g1 + 1;
                                                pieceSound
                                                    .play('token_move.mp3');
                                              });
                                            }
                                            // });
                                            //g1 = number + g1;
                                            number = 0;
                                          }
                                          // });
                                        },
                                        child: Center(
                                          child: Text("g1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                IgnorePointer(
                                  child: Center(
                                    child: AntiTile(
                                      index: index,
                                      accessedCell: greenPiecePath[g1Clear],
                                    ),
                                  ),
                                ),
                                // Green g2
                                if (greenPiece['g2'] == true)
                                  Center(
                                    child: Tile(
                                      pieceName: 'g2',
                                      diceValue: number,
                                      index: index,
                                      color: Colors.green,
                                      pieceSize: pieceSize,
                                      accessedCell: greenPiecePath[g2],
                                      child: InkWell(
//                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          print("'g2' is pressed $g2");
                                          setState(() {
                                            if (g2 == 2) {
                                              g2 = 5;
                                              g2Clear = 2;
                                            } else if (g2 + number <= 61) {
                                              g2Clear = g2;
                                              g2 = number + g2;
                                              number = 0;
                                            }
                                          });
                                        },
                                        child: Center(
                                          child: Text("g2",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                IgnorePointer(
                                  child: Center(
                                    child: AntiTile(
                                      index: index,
                                      accessedCell: greenPiecePath[g2Clear],
                                    ),
                                  ),
                                ),
                                // Green g3
                                if (greenPiece['g3'] == true)
                                  Center(
                                    child: Tile(
                                      pieceName: 'g3',
                                      diceValue: number,
                                      index: index,
                                      color: Colors.green,
                                      pieceSize: pieceSize,
                                      accessedCell: greenPiecePath[g3],
                                      child: InkWell(
//                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          print("'g3' is pressed $g3");
                                          setState(() {
                                            if (g3 == 3) {
                                              g3 = 5;
                                              g3Clear = 3;
                                            } else if (g3 + number <= 61) {
                                              g3Clear = g3;
                                              g3 = number + g3;
                                              number = 0;
                                            }
                                          });
                                        },
                                        child: Center(
                                          child: Text("g3",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                IgnorePointer(
                                  child: Center(
                                    child: AntiTile(
                                      index: index,
                                      accessedCell: greenPiecePath[g3Clear],
                                    ),
                                  ),
                                ),
                                // Green g2
                                if (greenPiece['g4'] == true)
                                  Center(
                                    child: Tile(
                                      pieceName: 'g4',
                                      diceValue: number,
                                      index: index,
                                      color: Colors.green,
                                      pieceSize: pieceSize,
                                      accessedCell: greenPiecePath[g4],
                                      child: InkWell(
//                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          print("'g4' is pressed $g4");
                                          setState(() {
                                            if (g4 == 4) {
                                              g4 = 5;
                                              g4Clear = 4;
                                            } else if (g4 + number <= 61) {
                                              g4Clear = g4;
                                              g4 = number + g4;
                                              number = 0;
                                            }
                                          });
                                        },
                                        child: Center(
                                          child: Text("g4",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                IgnorePointer(
                                  child: Center(
                                    child: AntiTile(
                                      index: index,
                                      accessedCell: greenPiecePath[g4Clear],
                                    ),
                                  ),
                                ),
                                // Center(
                                //   child: Tile(
                                //     pieceName: 'y1',
                                //     diceValue: number,
                                //     index: index,
                                //     color: Colors.yellow,
                                //     pieceSize: pieceSize,
                                //     accessedCell: yellowPiecePath[y1],
                                //   ),
                                // ),
                                // Center(
                                //   child: Tile(
                                //     pieceName: 'b1',
                                //     diceValue: number,
                                //     index: index,
                                //     color: Colors.blue,
                                //     pieceSize: pieceSize,
                                //     accessedCell: bluePiecePath[b1],
                                //   ),
                                // ),
                                // Center(
                                //   child: Tile(
                                //     pieceName: 'r1',
                                //     diceValue: number,
                                //     index: index,
                                //     color: Colors.red,
                                //     pieceSize: pieceSize,
                                //     accessedCell: redPiecePath[r1],
                                //   ),
                                // ),
                                // All Stars

                                IgnorePointer(
                                  child: Center(
                                    child: allStar.contains(index)
                                        ? Container(
                                            child: Center(
                                              child: Icon(
                                                Icons.star,
                                                size: pieceSize,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Center(
                child: Text(
              "$diceValuePrint",
              style: TextStyle(fontSize: 25),
            )),
            GestureDetector(
              onTap: () {
                // print("Dice is rolling");
                setState(() {
                  number = dice.nextInt(6) + 1;
                  pieceSound.play('dice_roll.mp3');
                  //g1 experimental moves:
                  // if (g1 + number + 1 <= 56) {
                  //   g1Clear = g1;
                  //   g1 = number + g1 + 1;
                  // }
                  // number = 5;
//                  flag = flag % 4;

                  if (number == 6 && threeSix != 2) {
                    threeSix++;
                    if (flag == 0 && greenPiece['g1'] != true) {
                      greenPiece['g1'] = true;
                      number = 0;
                    }
                    // Green
                    // else if (flag == 0 &&
                    //     greenPiece['g1'] == true &&
                    //     greenPiece['g2'] != true) {
                    //   greenPiece['g2'] = true;
                    //   number = 0;
                    // } else if (flag == 0 &&
                    //     greenPiece['g1'] == true &&
                    //     greenPiece['g2'] == true &&
                    //     greenPiece['g3'] != true) {
                    //   greenPiece['g3'] = true;
                    //   number = 0;
                    // } else if (flag == 0 &&
                    //     greenPiece['g1'] == true &&
                    //     greenPiece['g2'] == true &&
                    //     greenPiece['g3'] == true &&
                    //     greenPiece['g4'] != true) {
                    //   greenPiece['g4'] = true;
                    //   number = 0;
                    // }

                    //Yellow Part!
                    // if (flag == 1 && yellowPiece['y1'] != true) {
                    //   yellowPiece['y1'] = true;
                    //   number = 0;
                    // }
                    // if (flag == 2 && bluePiece['b1'] != true) {
                    //   bluePiece['b1'] = true;
                    //   number = 0;
                    // }
                    // if (flag == 3 && redPiece['r1'] != true) {
                    //   redPiece['r1'] = true;
                    //   number = 0;
                    // }
                  } else {
                    flag++;
                    // if (flag >= 4) {
                    if (flag >= 1) {
                      flag = 0;
                    }
                    threeSix = 0;
                  }
                  if (flag == 0 && threeSix == 0) {
                    color = Colors.yellow.shade900;
                    print("Flag is $flag = Green value =${number}");
                  } else if (flag == 1 && threeSix == 0) {
                    color = Colors.blue.shade900;
                    print("Flag is $flag = Yellow value =${number}");
                  } else if (flag == 2 && threeSix == 0) {
                    color = Colors.red.shade900;
                    print("Flag is $flag = Blue value =${number}");
                  } else if (flag == 3 && threeSix == 0) {
                    color = Colors.green.shade900;
                    print("Flag is $flag = Red value =${number}");
                  }
                  diceValuePrint = "Flag -> $flag Dice Number: $number";
                  print(
                      "Flag -> $flag && Number -> $number && threeSix -> $threeSix");
                  // print("$flag");
                  // First moves:
                  // if (g1 + number + 1 <= 56 &&
                  //     greenPiece['g1'] == true &&
                  //     flag == 0) {
                  //   g1 = number + g1 + 1;
                  // } else if (y1 + number + 1 <= 56 &&
                  //     yellowPiece['y1'] == true &&
                  //     flag == 1) {
                  //   y1 = number + y1 + 1;
                  // } else if (b1 + number + 1 <= 56 &&
                  //     bluePiece['b1'] == true &&
                  //     flag == 2) {
                  //   b1 = number + b1 + 1;
                  // } else if (r1 + number + 1 <= 56 &&
                  //     redPiece['r1'] == true &&
                  //     flag == 3) {
                  //   r1 = number + r1 + 1;
                  // }
                });
              },
              child: AvatarGlow(
                endRadius: 100,
                glowColor: color,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Transform.scale(
                    scale: .4,
                    child: Image(
                      image: AssetImage('assets/$number.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
