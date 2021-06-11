import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:kabyu_feather_webs/Widgets/booksList.dart';
import 'package:kabyu_feather_webs/Widgets/categorybooksllist.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:provider/provider.dart';

class BooksBasedOnCategory extends StatefulWidget {
  final mydata;

  const BooksBasedOnCategory({Key key, this.mydata}) : super(key: key);
  @override
  _BooksBasedOnCategoryState createState() => _BooksBasedOnCategoryState();
}

class _BooksBasedOnCategoryState extends State<BooksBasedOnCategory> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false)
        .loadBooksBasedCategory(widget.mydata);
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider productProvider = Provider.of<CategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNavigationBar(
                // icon: Icons.chevron_left,
                ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    "Books on",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 164,
              child: GridView.builder(
                itemCount: productProvider.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width / 2) / 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryBooks(
                      book: productProvider.productList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
