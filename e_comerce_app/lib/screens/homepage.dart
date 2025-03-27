import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/screens/cartscreen.dart';
import 'package:e_comerce_app/screens/detailscreen.dart';
import 'package:e_comerce_app/screens/listproduct.dart';
import 'package:e_comerce_app/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool inicioColor = true;
  bool carritoColor = false;
  bool acercaDeColor = false;
  bool contactoColor = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "prueba",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
            decoration: BoxDecoration(color: Colors.purple),
            accountEmail: Text("prueba@gmail.com"),
          ),
          ListTile(
            selected: inicioColor,
            onTap: () {
              setState(() {
                inicioColor = true;
                contactoColor = false;
                acercaDeColor = false;
                carritoColor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
          ),
          ListTile(
            selected: carritoColor,
            onTap: () {
              setState(() {
                carritoColor = true;
                contactoColor = false;
                acercaDeColor = false;
                inicioColor = false;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      Cartscreen(), // Regresar a la página de HomePage al presionar la flecha
                ),
              );
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Ir al carrito"),
          ),
          ListTile(
            selected: acercaDeColor,
            onTap: () {
              setState(() {
                acercaDeColor = true;
                contactoColor = false;
                carritoColor = false;
                inicioColor = false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text("Acerca de"),
          ),
          ListTile(
            selected: contactoColor,
            onTap: () {
              setState(() {
                contactoColor = true;
                acercaDeColor = false;
                carritoColor = false;
                inicioColor = false;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contacto"),
          ),
          ListTile(
            onTap: () {
              // Aquí puedes agregar la lógica para cerrar sesión
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Salir"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 200, // Ajusta la altura según sea necesario
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: [
          "images/man.jpg",
          "images/women.jpg",
          "images/camera.jpg",
        ].map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Categoría",
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
        const SizedBox(height: 10), // Espacio entre el título y las categorías
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
      ],
    );
  }

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

  Widget _buildNewAchives() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Nuevos productos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: "Nuevos productos",
                    ),
                  ),
                );
              },
              child: const Text(
                "Ver más",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Espacio entre el título y los productos
        // ✅ Imágenes alineadas de forma uniforme
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: "man.jpg",
                      price: 30.0,
                      name: "NUEVO",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: "man.jpg",
                price: 30.0,
                name: "NUEVO",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: "camera.jpg",
                      price: 30.0,
                      name: "NUEVO",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: "camera.jpg",
                price: 30.0,
                name: "NUEVO",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatured() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Destacado",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListProduct(
                        name: "Destacado",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Ver más",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: "man.jpg",
                      price: 30.0,
                      name: "NUEVO",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: "man.jpg",
                price: 30.0,
                name: "NUEVO",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: "camera.jpg",
                      price: 30.0,
                      name: "NUEVO",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: "camera.jpg",
                price: 30.0,
                name: "Nuevo",
              ),
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
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () => _key.currentState?.openDrawer(),
        ),
        actions: [
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
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildImageSlider(),
                  _buildCategory(),
                  //
                  const SizedBox(height: 40),
                  _buildFeatured(),
                  _buildNewAchives(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
