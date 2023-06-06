import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_application_1/models/catalog.dart";
import "package:flutter_application_1/widgets/drawer.dart";
import "package:flutter_application_1/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";
import "../widgets/item_widget.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var products = [];
  List<Item> list = [];

  getItems() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogData = await rootBundle.loadString('assets/files/catalog.json');
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
    return Scaffold(
      backgroundColor: Themes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalog App'.text.xl5.bold.make(),
        'Trending products'.text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.items[index];
        return CatalogItem(
          catalog: item,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      CatalogImage(image: catalog.image),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          catalog.name.text.bold.lg.color(Themes.darkBluishColor).make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              '\$${catalog.price}'.text.bold.xl.make(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Themes.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                child: 'Buy'.text.make(),
              ).px12()
            ],
          )
        ],
      ).expand()
    ])).white.square(150).rounded.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(Themes.creamColor)
        .rounded
        .p16
        .make()
        .p16()
        .w40(context);
  }
}
