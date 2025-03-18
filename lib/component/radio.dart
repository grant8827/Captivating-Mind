/*
 *  main.dart
 *
 *  Created by Ilia Chirkunov <xc@yar.net> on 28.12.2020.
 */

import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';

class radioPlayer extends StatefulWidget {
  const radioPlayer({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<radioPlayer> {
  final RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Captivating Mind Radio',
      url: 'https://usa20.fastcast4u.com/captivatingradio',
      imagePath: 'lib/assets/image/captivating_ming.png',
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: _radioPlayer.getArtworkImage(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Image artwork;
                if (snapshot.hasData) {
                  artwork = snapshot.data;
                } else {
                  artwork = Image.asset(
                    'lib/assets/image/captivating_ming.png',
                    fit: BoxFit.cover,
                  );
                }
                return Container(
                  height: 280,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: artwork,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                'Taking every thought Captive',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              metadata?[0] ?? 'Now Playing',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 136, 9, 0)),
            ),
            Text(
              metadata?[1] ?? '',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 50),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 136, 9, 0),
                iconSize: 60,
              ),
              onPressed: () {
                isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
              },
              icon: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
