import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
//import 'package:http/http.dart' as http;
import "package:flutter_application_1/models/cart.dart";
import "package:flutter_application_1/models/catalog.dart";
import "package:velocity_x/velocity_x.dart";
import "../store.dart";
import "../utilis/routes.dart";
import "../widgets/homeWidgets/catalog_list.dart";
import "../widgets/homeWidgets/header.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var products = [];
  var url = 'fakestoreapi.com';
  getItems() async {
    await Future.delayed(const Duration(seconds: 4));
    var catalogData = await rootBundle.loadString('assets/files/catalog.json');
    //var res = await http.get(Uri.https(url, "/products", {'limit': '10'}));
    //var catalogData = res.body;
    var decodedData = jsonDecode(catalogData);
    CatalogModel.items = List.from(decodedData['products'])
        .map((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as Store).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddItem, RemoveItem},
        builder: (context, _, __) => FloatingActionButton(
          backgroundColor: context.theme.primaryColor,
          onPressed: () => Navigator.pushNamed(context, Routes.cart),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red500,
            size: 22,
            count: cart.items.length,
            textStyle:
                const TextStyle(color: Vx.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                ).expand()
            ],
          ),
        ),
      ),
    );
  }
}
