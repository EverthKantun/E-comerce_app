import 'package:flutter/material.dart';
//TODO: MIN 11:21 VIDEO 11

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Cart', // Cambié 'Detail Page' a 'Cart'
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Volver a la pantalla anterior
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para las notificaciones
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16), // Añadido espaciado interno
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 130,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/man.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          10), // Añadido espaciado entre la imagen y el texto
                  Container(
                    height: 150,
                    width: 300,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Men Long Shirt"),
                          Text("Cloths"),
                          Text(
                            "\$30.00",
                            style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Añadido espaciado entre el precio y el contador
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      }
                                    });
                                  },
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
                                ),
                                Text(
                                  count.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
