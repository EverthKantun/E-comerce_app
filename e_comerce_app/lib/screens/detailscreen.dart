import 'package:e_comerce_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce_app/screens/cartscreen.dart';

class Detailscreen extends StatefulWidget {
  final String image;
  final double price;
  final String name;

  const Detailscreen({
    super.key,
    required this.image,
    required this.price,
    required this.name,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  int count = 1;

  Widget _buildSizeProduct({required String name}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }

  final myStyle = TextStyle(fontSize: 18, color: Colors.black87);

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 200,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: myStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: 5),
        Text(
          "\$${widget.price.toStringAsFixed(2)}", // Formato de precio con dos decimales
          style: myStyle.copyWith(color: Colors.red, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "Descripción",
          style: myStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Fondo gris claro
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(10), // Espaciado interno
      child: Wrap(
        children: <Widget>[
          Text(
            "Aquí va la descripción del producto. Proporciona detalles sobre el producto, sus características y beneficios.",
            style: myStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Talla",
          style: myStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
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
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colores disponibles",
          style: myStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Container(
          width: 340,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildColorProduct(color: Colors.black),
              _buildColorProduct(color: Colors.green),
              _buildColorProduct(color: Colors.orange),
              _buildColorProduct(color: Colors.brown),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cantidad",
          style: myStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 50,
          width: 100,
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
                    if (count > 1) {
                      count--;
                    }
                  });
                },
                child: Icon(Icons.remove, color: Colors.white),
              ),
              Text(
                count.toString(),
                style: myStyle.copyWith(color: Colors.white),
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
    );
  }

  Widget _buildButtonPart() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  Cartscreen(), // Regresar a la página de HomePage al presionar la flecha
            ),
          );
          //  lógica para el botón "Pagar"
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // Regresar a la página de HomePage al presionar la flecha
              ),
            );
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
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildImage(),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    children: [
                      _buildNameToDescriptionPart(),
                      SizedBox(height: 20),
                      _buildDescription(),
                      SizedBox(height: 20),
                      _buildSizePart(),
                      SizedBox(height: 20),
                      _buildColorPart(),
                      SizedBox(height: 20),
                      _buildQuantityPart(),
                      SizedBox(height: 20),
                      _buildButtonPart(),
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
