import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/store.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: 'Cart'.text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [const CardList().p32().expand(), CardTotal()],
      ),
    );
  }
}

class CardTotal extends StatelessWidget {
  CardTotal({super.key});
  final _cart = (VxState.store as Store).cart;

  @override
  Widget build(BuildContext context) {
    //print("Build");
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              builder: (context, _, __) {
                return '\$${_cart.totalPice}'.text.xl5.make();
              },
              mutations: const {RemoveItem}),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      "Buying functionality not available yet!".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.primaryColor)),
            child: 'Buy'.text.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveItem]);
    final CartModel cart = (VxState.store as Store).cart;
    return cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              title: cart.items[index].name.text.make(),
              trailing: IconButton(
                  onPressed: () {
                    RemoveItem(item: cart.items[index]);
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
            ),
            itemCount: cart.items.length,
          );
  }
}
