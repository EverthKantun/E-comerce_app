import 'package:flutter/material.dart';

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
            height: 230,  
            width: 180,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect( 
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/$image",
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
