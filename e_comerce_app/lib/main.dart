import 'package:e_comerce_app/screens/homepage.dart';
import 'package:e_comerce_app/screens/login.dart'; // 🔹 Importar la pantalla de Login
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDHiVK7QOpZU33IGJe0nDM4GjCjZJQzAkw",
        authDomain: "e-commerce-app-a7353.firebaseapp.com",
        projectId: "e-commerce-app-a7353",
        storageBucket: "e-commerce-app-a7353.firebasestorage.app",
        messagingSenderId: "601639133716",
        appId: "1:601639133716:web:2d219c247828723ab37d01",
        measurementId: "G-3DFB3QY4DB",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(),
      initialRoute: "/login", // 🔹 Establecer Login como la primera pantalla
      routes: {
        "/login": (context) => const Login(), // 🔹 Agregar ruta para Login
        "/home": (context) => const HomePage(), // 🔹 Agregar ruta para HomePage
      },
    );
  }
}
