import 'package:e_comerce_app/screens/login.dart';

import 'package:e_comerce_app/widgets/mybutton.dart';
import 'package:e_comerce_app/widgets/changescreen.dart';
import 'package:e_comerce_app/widgets/mytextformField.dart';
import 'package:e_comerce_app/widgets/passwordtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String name = "";
  String phoneNumber = "";
  bool obserText = true;

  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  void validation() async {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Usuario registrado: ${result.user?.uid}");
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
    }
  }

  Widget _buildAllTextFormField() {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "Nombre de usuario",
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, coloca un nombre de usuario";
              }
              if (value.length < 6) {
                return "Nombre de usuario demasiado corto";
              }
              return null;
            },
          ),
          MyTextFormField(
            name: "Email",
            onChanged: (value) {
              setState(() {
                email = value;
                print(email); //verificar que si se ingreso el correo
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, coloca un correo";
              } else if (!regExp.hasMatch(value)) {
                return "Correo inválido";
              }
              return null;
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Contraseña",
            onChanged: (value) {
              setState(() {
                password = value!;
                print(password); //verificar que si se ingreso la contraseñaks
              });
              return null;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, coloca una contraseña";
              }
              if (value.length < 8) {
                return "La contraseña debe contener al menos 8 caracteres";
              }
              return null;
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyTextFormField(
            name: "Número de celular",
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Por favor, coloca un número de teléfono";
              } else if (value.length != 10) {
                return "Coloca un número válido";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "Registrate",
            onPressed: validation,
          ),
          ChangeScreen(
            name: "Ingresar",
            whichAccount: "Ya tengo una cuenta creada: ",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const Login(),
                ),
              );
            },
          )
        ],
      ),
    );
RegExp regExp = RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? form = _formKey.currentState; // Permite valores nulos
    if (form != null && form.validate()) {
      print("sí");
    } else {
      print("no");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      "Registro",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ),
              const SizedBox(height: 20),
              _buildBottomPart(),
            ],
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          //para validar que se ingrese nombre de usuario
                          if (value == null || value.isEmpty) {
                            return "Por favor coloca nombre de usuario";
                          }
                          if (value.length < 6) {
                            return "Nombre de usuario demasiado corto";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Nombre de usuario",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (String? value) {
                          // para validar el correo usando regExp que está en la linea 11
                          if (value?.isEmpty ?? true) {
                            return "Coloca un correo";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Correo inválido";
                          }
                          return null; // Si pasa todas las validaciones, es válido
                        },
                        decoration: InputDecoration(
                            hintText: "Correo electrónico",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          //para validar la longitud de la contraseña
                          if (value == null || value.isEmpty) {
                            return "Por favor, coloca una contraseña";
                          }
                          if (value.length < 8) {
                            return "La contraseña debe contener al menos 8 caracteres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Contraseña",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                  obserText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, coloca un número de teléfono";
                          } else if (value.length != 10) {
                            return "Coloca un número válido";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Teléfono",
                            icon: Icon(Icons.phone),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[400],
                          ),
                          child: Text(
                            "Registrarme",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Ya tengo una cuenta creada: "),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              "Acceder",
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
