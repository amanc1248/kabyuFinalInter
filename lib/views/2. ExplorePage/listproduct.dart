import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/products_grid.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatelessWidget {
  final String title;
  final List<Product> myList;
  ListProducts({this.myList, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ProductGrid(
          count: myList.length,
        ),
      ),
    );
  }
}
