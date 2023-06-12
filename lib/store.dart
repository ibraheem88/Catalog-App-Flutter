import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

import 'models/cart.dart';

class Store extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  Store() {
    cart = CartModel();
    catalog = CatalogModel();
    cart.catalog = catalog;
  }
}
