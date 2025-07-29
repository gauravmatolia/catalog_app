import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({required this.item})
    : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            textScaleFactor: 1.7,
            "\$${item.price}",
            style: TextStyle(
              color: const Color.fromARGB(255, 63, 89, 101),
              fontWeight: FontWeight.w900
            ),
          ),
        ),
      ),
    );
  }
}
