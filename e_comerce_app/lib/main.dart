import 'package:e_comerce_app/screens/cartscreen.dart';
import 'package:e_comerce_app/screens/detailscreen.dart';
import 'package:e_comerce_app/screens/homepage.dart';
import 'package:e_comerce_app/screens/listproduct.dart';
import 'package:e_comerce_app/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:e_comerce_app/screens/login.dart';
import 'package:flutter/material.dart';

void main() async {
  if (kIsWeb) {
    Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDHiVK7QOpZU33IGJe0nDM4GjCjZJQzAkw",
          authDomain: "e-commerce-app-a7353.firebaseapp.com",
          projectId: "e-commerce-app-a7353",
          storageBucket: "e-commerce-app-a7353.firebasestorage.app",
          messagingSenderId: "601639133716",
          appId: "1:601639133716:web:2d219c247828723ab37d01",
          measurementId: "G-3DFB3QY4DB"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Cartscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
