import 'package:e_comerce_app/screens/homepage.dart';
import 'package:e_comerce_app/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final dynamic snapShot;
  const ListProduct({
    super.key,
    required String name,
    required this.snapShot,
  });

  // Mover la función fuera del método build
  Widget _buildFeaturedProduct({
    required String name,
    required double price,
    required String image,
  }) {
    return Card(
      elevation: 4, // Sombra de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 250,
            width: 180,
            child: Column(
              children: <Widget>[
                Container(
                  height: 190,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(15), // Bordes redondeados
                    image: DecorationImage(
                      image: AssetImage("images/$image"),
                      fit: BoxFit.cover, // Ajustar la imagen
                    ),
                  ),
                ),
                SizedBox(height: 8), // Espacio entre la imagen y el texto
                Text(
                  "\$ $price",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9b96d6),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // Regresar a la página de HomePage al presionar la flecha
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50], // Fondo degradado
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Destacado",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          "Ver más",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 700,
                  child: GridView.builder(
                    itemCount: snapShot.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      var product = snapShot.data!
                          .docs[index]; // Accede correctamente a cada documento
                      return SingleProduct(
                        image: product["image"] ?? '', // Control de null safety
                        price: product["price"] ?? 0.0,
                        name: product["name"] ?? 'Producto sin nombre',
                      );
                    },
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
