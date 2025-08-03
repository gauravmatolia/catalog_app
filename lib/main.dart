import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'], 
      price: json['price'], 
      imageUrl: json['imageUrl']
    );
  }
}

Future<List<Product>> fetchProductsFromAssets() async{
  
  // Load json string
  final String jsonString = await rootBundle.loadString('assets/data/items.json');

  // Decode json string
  final List<dynamic> jsonList = json.decode(jsonString);

  // map each product
  return jsonList.map((json) => Product.fromJson(json)).toList();
}

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catalog App',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          backgroundColor: const Color.fromARGB(255, 255, 129 ,8),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(onPressed: () {
              print('Search button pressed');
            }, 
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 40.0,
            ))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 129 ,8),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
              ),
              child: Row(
                spacing: 40.0,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text("Buy a pair now",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 223, 223, 223),
                        fontStyle: FontStyle.italic,
                        fontSize: 35,
                      ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      color: const Color.fromARGB(255, 255, 129 ,8),
                      elevation: 0.0,
                      child: Image.asset(
                        "assets/images/shoes.png",
                        ),
                      ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<Product>>(
                  future: fetchProductsFromAssets(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.hasError){
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No products found'));
                    }
                    else {
                      final products = snapshot.data!;
                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final product = products[index];
                            
                            return Card(
                              elevation: 4.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,size: 50);
                                      },
                                    )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${product.price}',
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                      );
                    }
                  },
                ),
                )
              )
          ],
        )
      ),
    );
  }
}