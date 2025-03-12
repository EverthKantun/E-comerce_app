import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

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
            child: Container(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
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
                SizedBox(
                  height: 20,
                ),
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
                      MyTextFormField(
                        name: "Email",
                        validator: (String? value) {
                          // para validar el correo usando regExp que está en la linea 11
                          if (value?.isEmpty ?? true) {
                            return "Coloca un correo";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Correo inválido";
                          }
                          return null; // Si pasa todas las validaciones, es válido
                        },
                      ),
                      PasswordTextFormField(
                        obserText: obserText,
                        name: "Contraseña",
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
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            obserText = !obserText;
                          });
                        },
                      ),
                      //TODO:Min 21:48
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
                      //Button
                      MyButton(
                        name: "Registrate",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChangeScreen(
                          name: "Ingresar",
                          whichAccount: "Ya tengo una cuenta creada: ",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
