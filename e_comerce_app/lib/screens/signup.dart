import 'package:e_comerce_app/screens/login.dart';
import 'package:e_comerce_app/widgets/mybutton.dart';
import 'package:e_comerce_app/widgets/changescreen.dart';
import 'package:e_comerce_app/widgets/mytextformField.dart';
import 'package:e_comerce_app/widgets/passwordtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//Se crea la pantalla de sign up para que el usuario se registre en la base de datos 
//y pueda tener acceso a la aplicación 
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 // Variables para almacenar los datos del usuario
  String email = "";
  String password = "";
  String name = "";
  String phoneNumber = "";
  bool obserText = true;
  // Patrón de expresión regular para validar el formato del correo electrónico
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
// Método para validar el formulario y registrar al usuario
  void validation() async {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    try {
      //Se crea un usuario en la base de datos de Firebase
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Usuario registrado: ${result.user?.uid}");
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
    }
  }
 // Método para construir todos los campos de texto del formulario
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
                 //verificar que si se ingreso el correo
                print(email);
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
                //verificar que si se ingreso la contraseña
                print(password); 
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
            //Se oculta o aparece la contraseña segun haga click el usuario en el ícono
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
//Se crea un botón de opción para el usuario por si este ya tiene una cuenta
//Lo que lo regresa a la pantalla de login
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
//Crea el título de la pantalla de registro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Evita que el contenido se ajuste al teclado
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
               // Espacio entre el título y la parte inferior
              const SizedBox(height: 20),
              // Llama al método que construye la parte inferior del formulario
              _buildBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
