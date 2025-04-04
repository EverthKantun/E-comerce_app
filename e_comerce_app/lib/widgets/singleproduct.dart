import 'package:flutter/material.dart';
//Widget con la utilidad de contruir las caracteristicas
//Que mostrará un producto en la HomePage y en la listpage
class SingleProduct extends StatelessWidget {
  // Propiedades
  final String image;
  final double price;
  final String name;
  final String description;

  // Constructor
  const SingleProduct({
    super.key,
    required this.image,
    required this.price,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 230,
            width: 180,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      height: 150,
                      width: 160,
                      fit: BoxFit.cover,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
