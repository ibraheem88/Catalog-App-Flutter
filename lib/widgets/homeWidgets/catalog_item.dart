import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/homeWidgets/add_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:flutter_application_1/models/catalog.dart";
import 'catalod_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          catalog.name.text.bold.lg.color(context.colors.secondary).make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              '\$${catalog.price}'.text.bold.xl.make(),
              AddButton(catalog: catalog)
            ],
          )
        ],
      ).expand()
    ])).color(context.cardColor).square(150).rounded.make().py16();
  }
}
