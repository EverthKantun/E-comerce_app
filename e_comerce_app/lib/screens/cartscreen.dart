import 'package:flutter/material.dart';
import 'package:e_comerce_app/screens/homepage.dart';
//TODO: MIN 11:21 VIDEO 11

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  int count = 1;
  Widget _buildProductCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
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
            SizedBox(width: 10),
            Expanded(
              child: Column(
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
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 120,
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
                              if (count > 1) count--;
                            });
                          },
                          child: Icon(Icons.remove, color: Colors.white),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text("Continuar", style: TextStyle(color: Colors.black)),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProductCard(), // Primera tarjeta
          SizedBox(height: 20),
          _buildProductCard(), // Segunda tarjeta
          SizedBox(height: 20),
          _buildProductCard(), //tercera tarjeta
        ],
      ),
    );
  }
}
