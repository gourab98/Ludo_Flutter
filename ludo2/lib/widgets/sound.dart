import 'package:audioplayers/audioplayers.dart';

class Sound {
  var diceSounds = AudioCache();
  var pieceSounds = AudioCache();

  void diceSound() {
    diceSounds.play('dice_roll.mp3');
  }

  void pieceSound() {
    pieceSounds.play('token_move.mp3');
  }
}
