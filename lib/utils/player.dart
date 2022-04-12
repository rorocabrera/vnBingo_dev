import 'package:just_audio/just_audio.dart';

class Reproductor {
  String url = ' ';

  late AudioPlayer _Player;

  Reproductor() {
    _init();
  }

  void _init() {
    _Player = AudioPlayer();
  }

  void dispose() {
    _Player.dispose();
  }

  void play() {
    _Player.play();
  }

  void setVolume(double vol) {
    _Player.setVolume(vol);
  }

  playSound(bolita) async {
    bool fuck = true;
    String route = 'assets/audio/' + bolita + '.mp3';
    try {
      await _Player.setAsset(route);
    } on PlayerException catch (e) {
      fuck = false;
      //print("Error code: ${e.code}");
      //print("Error message: ${e.message}");
      print('fuck no');
    } on PlayerInterruptedException catch (e) {
      fuck = false;
      //print("Connection aborted: ${e.message}");
      print('fuck no');
      return false;
    } catch (e) {
      fuck = false;
      //print(e);
      print('fuck no');
    }
    _Player.play();
  }
}
