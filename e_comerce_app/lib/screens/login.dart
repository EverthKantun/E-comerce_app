import 'package:e_comerce_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 🔹 Importación de FirebaseAuth

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool obserText = true;

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // 🔹 Instancia de FirebaseAuth

  TextEditingController emailController = TextEditingController(); // 🔹 Controlador para el email
  TextEditingController passwordController = TextEditingController(); // 🔹 Controlador para la contraseña

  // 🔹 Nueva función para autenticar al usuario en Firebase
  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        print("Inicio de sesión exitoso");

        Navigator.pushReplacementNamed(context, "/home"); // 🔹 Redirigir tras autenticación
      } catch (e) {
        print("Error al iniciar sesión: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correo o contraseña incorrectos")), // 🔹 Mensaje de error
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Ingresar",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: emailController, // 🔹 Asignado el controlador
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Por favor, coloca un correo";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Correo electrónico",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      controller: passwordController, // 🔹 Asignado el controlador
                      obscureText: obserText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, coloca una contraseña";
                        }
                        if (value.length < 8) {
                          return "La contraseña debe contener al menos 8 caracteres";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              obserText = !obserText;
                            });
                          },
                          child: Icon(
                            obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loginUser, // 🔹 Llamar a loginUser en vez de validation()
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan[100],
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          "Ingresar",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("No tengo una cuenta"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            "Registrarme",
                            style: TextStyle(color: Colors.cyan, fontSize: 17),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
