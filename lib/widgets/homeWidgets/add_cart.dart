import "package:flutter/material.dart";
import "package:flutter_application_1/models/cart.dart";
import "package:flutter_application_1/store.dart";
import "package:velocity_x/velocity_x.dart";
import "../../models/catalog.dart";

class AddButton extends StatelessWidget {
  final Item catalog;
  const AddButton({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddItem, RemoveItem]);
    final cart = (VxState.store as Store).cart;
    bool added = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!added) {
          AddItem(item: catalog);
          added = added.toggle();
        }
      },
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor:
              MaterialStateProperty.all(context.theme.primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: added
          ? const Icon(Icons.done)
          : const Icon(Icons.shopping_cart_checkout),
    ).pOnly(right: 8);
  }
}
