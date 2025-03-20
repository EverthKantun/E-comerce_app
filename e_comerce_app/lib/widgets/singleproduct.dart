import 'package:flutter/material.dart';
//TODO VIDEO7 16:17

class SingleProduct extends StatelessWidget {
  // Propiedades
  final String image;
  final double price;
  final String name;

  // Constructor
  const SingleProduct({
    Key? key,
    required this.image,
    required this.price, 
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 230,  // Altura reducida para evitar desbordamiento
            width: 180,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(  // Asegura que la imagen no se desborde
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/$image",
                      height: 150,  // Tamaño controlado
                      width: 160,
                      fit: BoxFit.cover,  // Evita deformaciones
                    ),
                  ),
                ),
                Text(
                  "\$ ${price.toString()}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9b96d6),
                  ),
                ),
                Text(
                  name,
                  maxLines: 1,  // Limita a una línea para evitar desbordamiento
                  overflow: TextOverflow.ellipsis,  // Muestra "..." si el texto es largo
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
