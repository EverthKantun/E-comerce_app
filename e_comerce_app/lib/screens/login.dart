import 'package:e_comerce_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Se crea la pantalla de login para que el usuario pueda acceder a la aplicación
//Se utilizan la credencial correo electrónico y contraseña para validar al usuario
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

  //Se autentifica al usuario en Firebase
  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        print("Inicio de sesión exitoso");
        //Se redirije al usuario tras autenticación
        Navigator.pushReplacementNamed(context, "/home"); 
      } catch (e) {
        //Si la contraseña o el correo son incorrectos se lanza un aviso de error
        print("Error al iniciar sesión: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correo o contraseña incorrectos")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // Validación del correo electrónico y la contraseña
        //Ambos tienen que encontrarse en la base de datos de Firebase
        //El usuario primero debe pasar por la pantalla de sign up
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
                      controller: emailController, 
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
                      controller: passwordController,
                      // Oculta el texto si es verdadero 
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
                              // Cambia el estado de visibilidad
                              obserText = !obserText;
                            });
                          },
                          child: Icon(
                            obserText == true
                            //Icono de visibilidad de la contraseña
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
                        //Llama a loginuser al presionar el botón lo que da acceso
                        //a la Homepage
                        onPressed: loginUser, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan[100],
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          "Ingresar",
                        ),
                      ),
                    ),
                    //Se le da la opción al usuario para ir a la página de sign up 
                    //para registrarse
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
