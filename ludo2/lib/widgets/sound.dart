import 'package:audioplayers/audioplayers.dart';

class Sound {
  var diceSound = AudioCache();

  void dicesound() {
    diceSound.play('dice_roll.mp3');
  }
}
