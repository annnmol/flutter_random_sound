// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(child: Text('Random Sounds')),
        ),
        body: const SafeArea(child: SoundApp()),
      ),
    );
  }
}

class SoundApp extends StatefulWidget {
  const SoundApp({super.key});

  @override
  State<SoundApp> createState() => _SoundAppState();
}

class _SoundAppState extends State<SoundApp> {
  int soundFileNumber = 1;

  handleBtnClick({int fileNumber = 5}) {
    // setState(() {
    //   soundFileNumber = fileNumber;
    // });
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/sounds/note$fileNumber.wav"),
    );
  }

  Expanded renderColorBlocks(
      {Color? colorCode = Colors.yellow, int fileNumber = 5}) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          backgroundColor: colorCode,
        ),
        onPressed: () {
          handleBtnClick(fileNumber: fileNumber);
        },
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        renderColorBlocks(colorCode: Colors.lightBlue[400], fileNumber: 1),
        renderColorBlocks(colorCode: Colors.indigo, fileNumber: 2),
        renderColorBlocks(colorCode: Colors.brown, fileNumber: 3),
        renderColorBlocks(colorCode: Colors.green, fileNumber: 4),
        renderColorBlocks(colorCode: Colors.yellow, fileNumber: 5),
        renderColorBlocks(colorCode: Colors.orangeAccent, fileNumber: 6),
        renderColorBlocks(colorCode: Colors.red[400], fileNumber: 7),
      ],
    );
  }
}
