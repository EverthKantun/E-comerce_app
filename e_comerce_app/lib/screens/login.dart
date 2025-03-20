import 'package:e_comerce_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

void validation() {
  final FormState? form = _formKey.currentState; // Permite valores nulos
  if (form != null && form.validate()) {
    print("sí");
  } else {
    print("no");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
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
              Container(
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
                      validator: (String? value) {
                        // para validar el correo usando regExp que está en la linea 11
                        if (value?.isEmpty ?? true) {
                          return "Por favor, coloca un correo";

                          return "Coloca un correo";

                        } else if (!regExp.hasMatch(value!)) {
                          return "Correo inválido";
                        }
                        return null; // Si pasa todas las validaciones, es válido
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "corre electrónico",
                          hintStyle: TextStyle(color: Colors.black)),
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
                        border: OutlineInputBorder(),
                        hintText: "contraseña",
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
                        onPressed: () {
                          validation();
                        },
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
