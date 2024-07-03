import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      print(' O áudio terminou de tocar ');
    });
  }

  void _playAudio() async {
    //const String path = 'C:\\teste\\file.mp3';  
   //await _audioPlayer.play(DeviceFileSource(path));

   print('O usuário apertou o play ');
   await _audioPlayer.play(UrlSource('https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'));
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
    print(' O usuário apertou stop ');
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _playAudio,
              child: Text('Play'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _stopAudio,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
