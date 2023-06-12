import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_detail.dart';
import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetail(catalog: item))),
          child: CatalogItem(
            catalog: item,
          ),
        );
      },
    );
  }
}
