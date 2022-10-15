import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/app.dart';
import 'package:window_size/window_size.dart';

void main() {
  setHashUrlStrategy();

  runApp(const SosAb());
}

const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Stug och Städ Ab');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static const String _title = 'Stug och Städ Ab';

//   // This widget is the root of your application.
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: _title,
//   //     theme: ThemeData(
//   //       // This is the theme of your application.
//   //       //
//   //       // Try running your application with "flutter run". You'll see the
//   //       // application has a blue toolbar. Then, without quitting the app, try
//   //       // changing the primarySwatch below to Colors.green and then invoke
//   //       // "hot reload" (press "r" in the console where you ran "flutter run",
//   //       // or simply save your changes to "hot reload" in a Flutter IDE).
//   //       // Notice that the counter didn't reset back to zero; the application
//   //       // is not restarted.
//   //       primarySwatch: Colors.blue,
//   //     ),
//   //     home: const MyHomePage(title: _title),
//   //   );
//   // }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // // }

  // @override
  // Widget build(BuildContext context) {
  //   // This method is rerun every time setState is called, for instance as done
  //   // by the _incrementCounter method above.
  //   //
  //   // The Flutter framework has been optimized to make rerunning build methods
  //   // fast, so that you can just rebuild anything that needs updating rather
  //   // than having to individually change instances of widgets.
  //   return Scaffold(
  //     appBar: AppBar(
  //       // Here we take the value from the MyHomePage object that was created by
  //       // the App.build method, and use it to set our appbar title.
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.of(context).push(
  //               MaterialPageRoute(builder: (context) => const LoginPage()));
  //         },
  //         child: const Text('Start'),
  //       ),
  //       // Center is a layout widget. It takes a single child and positions it
  //       // in the middle of the parent.
  //     ),
  //     // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }

