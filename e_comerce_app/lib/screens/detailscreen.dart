import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  int count = 1;
  Widget _buildSizeProduct({required String name}) {
    return Container(
      height: 60,
      width: 60,
      color: Colors.blue,
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

//para reutilizar el tamaño
  final myStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 200,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/man.jpg"))),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Man T-Shirt",
                                  style: myStyle,
                                ),
                                Text(
                                  "\$ 30.0",
                                  style: myStyle,
                                ),
                                Text(
                                  "Description",
                                  style: myStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        "Esta es la descripción del producto",
                        style: myStyle,
                      )
                    ],
                  ),
                ),
                Text(
                  "Size",
                  style: myStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildSizeProduct(name: "S"),
                      _buildSizeProduct(name: "M"),
                      _buildSizeProduct(name: "L"),
                      _buildSizeProduct(name: "XL"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Colores disponibles",
                  style: myStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildColorProduct(color: Colors.cyan),
                      _buildColorProduct(color: Colors.green),
                      _buildColorProduct(color: Colors.orange),
                      _buildColorProduct(color: Colors.brown),
                    ],
                  ),
                ),
                //aquí comienza el apartado de quentity
                SizedBox(
                  height: 10,
                ),
                Text(
                  "cantidad",
                  style: myStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count > 1) {
                                count--;
                              }
                            });
                          },
                          child: Icon(Icons.remove)),
                      Text(count.toString(), style: myStyle),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Pagar",
                      style: TextStyle(color: Colors.white, fontSize: 19),
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
