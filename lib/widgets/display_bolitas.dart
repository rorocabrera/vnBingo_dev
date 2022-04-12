import 'package:flutter/material.dart';

import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/utils/player.dart';
import 'package:provider/provider.dart';

class display_bolitas_and_sound extends StatefulWidget {
  const display_bolitas_and_sound({
    Key? key,
    required this.bolaS,
  }) : super(key: key);

  final String bolaS;

  @override
  State<display_bolitas_and_sound> createState() =>
      _display_bolitas_and_soundState();
}

class _display_bolitas_and_soundState extends State<display_bolitas_and_sound> {
  late final Reproductor _reproductor;

  @override
  void initState() {
    super.initState();
    _reproductor = Reproductor();
    _reproductor.setVolume(0.5);
    print('declara reproductor');
  }

  @override
  void dispose() {
    super.dispose();
    _reproductor.dispose();
    print('aniquila reproductor');
  }

  @override
  Widget build(BuildContext context) {
    final thesocket = Provider.of<Proveedor>(context);

    if (widget.bolaS != ' ' && thesocket.soundRequest) {
      _reproductor.playSound(widget.bolaS);
      thesocket.setsoundRequest(false);
    }

    _reproductor.setVolume(thesocket.volume);

    return SizedBox(
        width: double.infinity,
        height: 100,
        child: Center(child: Text('Bolita: ' + widget.bolaS)));
  }
}
