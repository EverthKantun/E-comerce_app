import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/screens/cartscreen.dart';
import 'package:e_comerce_app/screens/detailscreen.dart';
import 'package:e_comerce_app/screens/listproduct.dart';
import 'package:e_comerce_app/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import 'farewellscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product? zapatosdata;
  Product? blusadata;
  Product? playeradata;
  Product? celulardata;
  Product? smartwatchdata;

  bool inicioColor = true;
  bool carritoColor = false;
  bool acercaDeColor = false;
  bool contactoColor = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // Cargar productos destacados
      final featuresSnapshot = await FirebaseFirestore.instance
          .collection("products")
          .doc("hC1CEb2BqoraHUlR82BD")
          .collection("featuresproducts")
          .get();

      if (featuresSnapshot.docs.isNotEmpty) {
        zapatosdata = Product(
          image: featuresSnapshot.docs[0]["image"],
          name: featuresSnapshot.docs[0]["name"],
          price: (featuresSnapshot.docs[0]["price"] as num).toDouble(),
          description: featuresSnapshot.docs[0]["description"],
        );
        playeradata = Product(
          image: featuresSnapshot.docs[1]["image"],
          name: featuresSnapshot.docs[1]["name"],
          price: (featuresSnapshot.docs[1]["price"] as num).toDouble(),
          description: featuresSnapshot.docs[1]["description"],
        );
        blusadata = Product(
          image: featuresSnapshot.docs[2]["image"],
          name: featuresSnapshot.docs[2]["name"],
          price: (featuresSnapshot.docs[2]["price"] as num).toDouble(),
          description: featuresSnapshot.docs[2]["description"],
        );
      }

      // Cargar nuevos productos
      final newAchivesSnapshot = await FirebaseFirestore.instance
          .collection("products")
          .doc("hC1CEb2BqoraHUlR82BD")
          .collection("newachives")
          .get();

      if (newAchivesSnapshot.docs.isNotEmpty) {
        celulardata = Product(
          image: newAchivesSnapshot.docs[0]["image"],
          name: newAchivesSnapshot.docs[0]["name"],
          price: (newAchivesSnapshot.docs[0]["price"] as num).toDouble(),
          description: newAchivesSnapshot.docs[0]["description"],
        );
        smartwatchdata = Product(
          image: newAchivesSnapshot.docs[1]["image"],
          name: newAchivesSnapshot.docs[1]["name"],
          price: (newAchivesSnapshot.docs[1]["price"] as num).toDouble(),
          description: newAchivesSnapshot.docs[1]["description"],
        );
      }

      setState(() {}); // Actualiza el estado después de cargar los datos
    } catch (e) {
      print("Error al cargar datos: $e");
      // Aquí puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }

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
                  builder: (context) => Cartscreen(),
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => FarewellScreen(),
                ),
              );

              // Cerrar la aplicación después de un retraso
              Future.delayed(Duration(seconds: 2), () {
                // Cierra la aplicación
                Navigator.of(context).pop(); // Cierra la pantalla de despedida
              });
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Salir"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 200,
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
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
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Categoría",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: 'Vestidos',
                      snapShot: FirebaseFirestore.instance
                          .collection("category")
                          .doc("L1BzfTuaygKeQwcLK2yq")
                          .collection("dress")
                          .get(),
                    ),
                  ),
                );
              },
              child:
                  _buildCategoryProduct(image: "dress.png", color: 0xff33dcfd),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: 'Camisas',
                      snapShot: FirebaseFirestore.instance
                          .collection("category")
                          .doc("L1BzfTuaygKeQwcLK2yq")
                          .collection("shirts")
                          .get(),
                    ),
                  ),
                );
              },
              child:
                  _buildCategoryProduct(image: "shirt.png", color: 0xfff38cdd),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: 'Zapatos',
                      snapShot: FirebaseFirestore.instance
                          .collection("category")
                          .doc("L1BzfTuaygKeQwcLK2yq")
                          .collection("shoes")
                          .get(),
                    ),
                  ),
                );
              },
              child:
                  _buildCategoryProduct(image: "shoe.png", color: 0xff4ff2af),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: 'Pantalones',
                      snapShot: FirebaseFirestore.instance
                          .collection("category")
                          .doc("L1BzfTuaygKeQwcLK2yq")
                          .collection("pant")
                          .get(),
                    ),
                  ),
                );
              },
              child:
                  _buildCategoryProduct(image: "pants.png", color: 0xff74acf7),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProduct(
                      name: 'Corbatas',
                      snapShot: FirebaseFirestore.instance
                          .collection("category")
                          .doc("L1BzfTuaygKeQwcLK2yq")
                          .collection("tie")
                          .get(),
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(image: "tie.png", color: 0xfffc6c8d),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryProduct({required String image, required int color}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        maxRadius: 45,
        backgroundColor: Color(color),
        child: Image(
          height: 45,
          color: Colors.black,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  Widget _buildNewAchives() {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.30),
                child: const Text(
                  "Nuevos Productos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListProduct(
                        name: "Nuevos Productos",
                        snapShot: FirebaseFirestore.instance
                            .collection("products")
                            .doc("hC1CEb2BqoraHUlR82BD")
                            .collection("newachives")
                            .get(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.30),
                  child: const Text(
                    "Ver más",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: smartwatchdata?.image ?? "man.jpg",
                      price: smartwatchdata?.price ?? 30.00,
                      name: smartwatchdata?.name ?? "Nuevecito",
                      description: smartwatchdata?.description ??
                          "Descripción no disponible",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: smartwatchdata?.image ?? "man.jpg",
                price: smartwatchdata?.price ?? 30.00,
                name: smartwatchdata?.name ?? "Nuevecito",
                description:
                    smartwatchdata?.description ?? "Descripción no disponible",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: celulardata?.image ?? "man.jpg",
                      price: celulardata?.price ?? 30.00,
                      name: celulardata?.name ?? "Nuevecito",
                      description: celulardata?.description ??
                          "Descripción no disponible",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: celulardata?.image ?? "man.jpg",
                price: celulardata?.price ?? 30.00,
                name: celulardata?.name ?? "Nuevecito",
                description:
                    celulardata?.description ?? "Descripción no disponible",
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
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.30),
                child: const Text(
                  "Destacados",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListProduct(
                        name: "Destacados",
                        snapShot: FirebaseFirestore.instance
                            .collection("products")
                            .doc("hC1CEb2BqoraHUlR82BD")
                            .collection("featuresproducts")
                            .get(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.30),
                  child: const Text(
                    "Ver más",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: playeradata?.image ?? "man.jpg",
                      price: playeradata?.price ?? 30.00,
                      name: playeradata?.name ?? "Nuevecito",
                      description: playeradata?.description ??
                          "Descripción no disponible",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: playeradata?.image ?? "man.jpg",
                price: playeradata?.price ?? 30.00,
                name: playeradata?.name ?? "Nuevecito",
                description:
                    playeradata?.description ?? "Descripción no disponible",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      image: blusadata?.image ?? "camera.jpg",
                      price: blusadata?.price ?? 30.00,
                      name: blusadata?.name ?? "Nuevecito",
                      description:
                          blusadata?.description ?? "Descripción no disponible",
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: blusadata?.image ?? "man.jpg",
                price: blusadata?.price ?? 30.00,
                name: blusadata?.name ?? "Nuevecito",
                description:
                    blusadata?.description ?? "Descripción no disponible",
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
          'Inicio',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSlider(),
            _buildCategory(),
            const SizedBox(height: 40),
            _buildFeatured(),
            _buildNewAchives(),
          ],
        ),
      ),
    );
  }
}
