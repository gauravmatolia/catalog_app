import 'dart:convert';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    final catalogJson = await rootBundle.loadString("assets/files/products.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // print(productsData); 
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CatalogApp")
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
          ): 
          Center(child: CircularProgressIndicator(),),
      ),
      drawer: MyDrawer(),
    );
  }
}