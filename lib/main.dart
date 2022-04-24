import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
        child: MaterialApp(
        title: 'Taxi Bookings App',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        home: Scaffold(appBar: AppBar(title: Text("Welcome to the Taxi app!")),),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});

  // this method is important for real-time user locations and pickups
  // whenever this function is called, restarts app from the beginning,
  // initializing any global variables again
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp()
  {
    setState(() {
      key: UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        key: key,
        child: widget.child!,
    );
  }
}


