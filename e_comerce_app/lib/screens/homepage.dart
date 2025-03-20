import 'package:e_comerce_app/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildCategoryProduct({required String image, required int color}) {
    return CircleAvatar(
      maxRadius: 45,
      backgroundColor: Color(color),
      child: Image(
        height: 45,
        color: Colors.black,
        image: AssetImage("images/$image"),
      ),
    );
  }

  Widget _buildBothFeaOrNew() {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categoria",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ver más",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategoryProduct(image: "dress.png", color: 0xff33dcfd),
            _buildCategoryProduct(image: "shirt.png", color: 0xfff38cdd),
            _buildCategoryProduct(image: "shoe.png", color: 0xff4ff2af),
            _buildCategoryProduct(image: "pants.png", color: 0xff74acf7),
            _buildCategoryProduct(image: "tie.png", color: 0xfffc6c8d),
          ],
        ),
        SizedBox(height: 20),

        // ⚠️ Corrección sintáctica: falta una coma después del SizedBox
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
          children: [
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
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => _key.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: 20),
                _buildBothFeaOrNew(),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nuevos productos",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ver más",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SingleProduct(
                      image: "man.jpg",
                      price: 30.0,
                      name: "NUEVO",
                    ),
                    SingleProduct(
                      image: "camera.jpg",
                      price: 30.0,
                      name: "Nuevo",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
