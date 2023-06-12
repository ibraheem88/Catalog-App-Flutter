import 'package:velocity_x/velocity_x.dart';

import '../store.dart';
import 'catalog.dart';

class CartModel {
  CatalogModel _catalog = CatalogModel();

  final List<int> _ids = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _ids.map((id) => CatalogModel.getById(id)).toList();

  num get totalPice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  void addItem(item) {
    _ids.add(item.id);
  }

  void removeItems(item) {
    _ids.remove(item.id);
  }
}

class AddItem extends VxMutation<Store> {
  final Item item;
  AddItem({
    required this.item,
  });
  @override
  perform() {
    store?.cart._ids.add(item.id);
  }
}

class RemoveItem extends VxMutation<Store> {
  final Item item;
  RemoveItem({
    required this.item,
  });
  @override
  perform() {
    store?.cart._ids.remove(item.id);
  }
}
