import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:provider/provider.dart';

Widget buildCategory(context) {
  CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
  print(categoryProvider.categoryList.length);
  print('*********************');
  return Container(
    child: categoryProvider.categoryList.length == 0
        ? Center(child: CircularProgressIndicator())
        : GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            children:
                List.generate(categoryProvider.categoryList.length, (index) {
              print(categoryProvider.categoryList.length);
              if (index == 5) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("More"),
                        Icon(Icons.add),
                      ],
                    ),
                    color: Colors.blue,
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(categoryProvider.categoryList[index].name),
                  color: Color(0xffF2E7FE),
                ),
              );
            }),
          ),
    height: MediaQuery.of(context).size.height / 7,
  );
}
