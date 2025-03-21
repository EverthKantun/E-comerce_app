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
          ),
        ),
      ),
    );
  }
}
