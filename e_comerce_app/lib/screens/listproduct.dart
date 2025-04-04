import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detailscreen.dart'; 
//Página que se crea para visualizar la lista de productos, cada una contenido en 
class ListProduct extends StatelessWidget {
  final Future<QuerySnapshot> snapShot;
  final String name;

  const ListProduct({
    super.key,
    required this.name,
    required this.snapShot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Regresar a la página anterior
            Navigator.of(context).pop(); 
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
            // Fondo degradado
            colors: [Colors.white, Colors.blue.shade50], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: snapShot,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error al cargar productos.'));
            }

            final productDocs = snapshot.data?.docs ?? [];

            if (productDocs.isEmpty) {
              return Center(child: Text('No se encontraron productos.'));
            }

            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          // Regresa a HomePage
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(); 
                            },
                            child: Text(
                              "Ver menos",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 700,
                      child: GridView.builder(
                        itemCount: productDocs.length,
                        itemBuilder: (ctx, index) {
                          var product = productDocs[
                              index]; 
                          // Accede correctamente a cada documento
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                //Construcción del recuadro del producto 
                                MaterialPageRoute(
                                  builder: (context) => Detailscreen(
                                    image: product["image"],
                                    price: (product["price"] as num).toDouble(),
                                    name: product["name"],
                                    description: product["description"] ??
                                        "Descripción no disponible", 
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Imagen del producto
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                      child: Image.network(
                                        product["image"] ?? '',
                                        fit: BoxFit
                                        // Ajusta la imagen para cubrir el contenedor
                                            .cover, 
                                        height:
                                        // Altura fija para las imágenes
                                            150, 
                                        width:
                                        // Ancho completo
                                            double.infinity, 
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Nombre del producto
                                        Text(
                                          product["name"] ??
                                              'Producto sin nombre',
                                          style: TextStyle(
                                            fontSize:
                                                16, // Tamaño de fuente aumentado
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        // Precio del producto
                                        Text(
                                          "\$${(product["price"] as num).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              0.75, // Ajusta la relación de aspecto
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
