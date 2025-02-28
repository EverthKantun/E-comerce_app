import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    decoration: InputDecoration(
                        hintText: "Correo electrónico",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(Icons.visibility, color: Colors.black),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
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
                      onPressed: () {},
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
    ));
  }
}
