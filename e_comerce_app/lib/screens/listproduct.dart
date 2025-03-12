//TODO: VIDEO 7 MIN 3
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildFeaturedProduct({
      required String name,
      required double price,
      required String image,
    }) {
      return Card(
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
                      image: DecorationImage(
                        image: AssetImage("images/$image"),
                      ),
                    ),
                  ),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Destacado",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ver más",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFeaturedProduct(
                  image: "man.jpg",
                  price: 30.0,
                  name: "Man Long T-Shirt",
                ),
                _buildFeaturedProduct(
                  image: "camera.jpg",
                  price: 30.0,
                  name: "Women white watch",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedProduct(
      {required String image, required double price, required String name}) {
    return Column(
      children: [
        Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "\$$price",
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
