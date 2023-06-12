import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/homeWidgets/add_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            AddButton(
              catalog: catalog,
            ).px12().wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.bold.xl4.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    'Eu veniam ad officia id eiusmod laboris consequat minim aliquip excepteur magna commodo. Officia dolore ad aliqua id anim consectetur minim magna exercitation incididunt occaecat incididunt reprehenderit laborum.'
                        .text
                        .textStyle(context.captionStyle)
                        .justify
                        .make()
                        .p16()
                  ],
                ).pOnly(top: 50),
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}
