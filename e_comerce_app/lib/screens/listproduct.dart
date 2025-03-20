import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  // Mover la función fuera del método build
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

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            Column(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    children: <Widget>[
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
                      _buildFeaturedProduct(
                        image: "bag.jpg",
                        price: 30.0,
                        name: "Women black bag",
                      ),
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
                      _buildFeaturedProduct(
                        image: "bag.jpg",
                        price: 30.0,
                        name: "Women black bag",
                      ),
                    ],
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
