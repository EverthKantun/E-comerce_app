import 'package:e_comerce_app/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
//TODO VIDEO7 16:17
class ListProduct extends StatelessWidget {
  const ListProduct({super.key});
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
                      SingleProduct(
                        image: "man.jpg",
                        price: 30.0,
                        name: "Man Long T-Shirt",
                      ),
                      SingleProduct(
                        image: "camera.jpg",
                        price: 30.0,
                        name: "Women white watch",
                      ),
                      SingleProduct(
                        image: "bag.jpg",
                        price: 30.0,
                        name: "Women black bag",
                      ),
                      SingleProduct(
                        image: "man.jpg",
                        price: 30.0,
                        name: "Man Long T-Shirt",
                      ),
                       SingleProduct(
                        image: "camera.jpg",
                        price: 30.0,
                        name: "Women white watch",
                      ),
                       SingleProduct(
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
