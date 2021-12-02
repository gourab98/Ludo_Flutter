import 'package:flutter/material.dart';
import 'package:ludo/ludo_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressClassic = false;
  bool pressArrow = false;
  bool pressQuick = false;

  bool twoPlayer = false;
  bool threePlayer = false;
  bool fourPlayer = false;

  String colorName = "Nothing";
  String playerName = "None";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SELECT VARIATION",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              pressClassic = !pressClassic;
                              pressArrow = false;
                              pressQuick = false;
                              colorName = "Pressed Classic";
                            });
                          },
                          elevation: 2.0,
                          fillColor: pressClassic ? Colors.red : Colors.brown,
                          // child: Text(
                          //   '',
                          //   style: TextStyle(fontSize: 30.0),
                          // ),
                          padding: EdgeInsets.all(45.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CLASSIC",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              pressArrow = !pressArrow;
                              pressClassic = false;
                              pressQuick = false;
                              colorName = "Pressed Arrow";
                            });
                          },
                          elevation: 2.0,
                          fillColor: pressArrow ? Colors.red : Colors.brown,
                          // child: Text(
                          //   '',
                          //   style: TextStyle(fontSize: 30.0),
                          // ),
                          padding: EdgeInsets.all(45.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ARROW",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              pressQuick = !pressQuick;
                              pressArrow = false;
                              pressClassic = false;
                              colorName = "Pressed Quick";
                            });
                          },
                          elevation: 2.0,
                          fillColor: pressQuick ? Colors.red : Colors.brown,
                          // child: Text(
                          //   '',
                          //   style: TextStyle(fontSize: 30.0),
                          // ),
                          padding: EdgeInsets.all(45.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "QUICK",
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'CHOOSE NAME AND COLOR',
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    child: Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: twoPlayer,
                        onChanged: (bool? twoPlayer) {
                          setState(() {
                            this.twoPlayer = twoPlayer!;
                            threePlayer = false;
                            fourPlayer = false;
                            playerName = "Pressed 2 Player";
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('2 PLAYER',
                      style: TextStyle(fontSize: 24, color: Colors.red)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    child: Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: threePlayer,
                        onChanged: (bool? threePlayer) {
                          setState(() {
                            this.threePlayer = threePlayer!;
                            twoPlayer = false;
                            fourPlayer = false;
                            playerName = "Pressed 3 Player";
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('3 PLAYER',
                      style: TextStyle(fontSize: 24, color: Colors.red)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    child: Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: fourPlayer,
                        onChanged: (bool? fourPlayer) {
                          setState(() {
                            this.fourPlayer = fourPlayer!;
                            twoPlayer = false;
                            threePlayer = false;
                            playerName = "Pressed 4 Player";
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('4 PLAYER',
                      style: TextStyle(fontSize: 24, color: Colors.red)),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // return newPage(colorName, playerName);
                        return LudoBoard(
                          colorName: colorName,
                          playerName: playerName,
                        );
                      },
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                  child: Text(
                    'START',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget newPage(String a, String b) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ludo Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have selected -> $a',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'You have selected -> $b',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
