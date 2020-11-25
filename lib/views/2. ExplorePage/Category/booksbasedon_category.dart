import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/books_model.dart';
import 'package:kabyu_feather_webs/views/Navigation/topnavigation.dart';
import 'package:kabyu_feather_webs/widgets/booksList.dart';

class BooksBasedOnCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                itemCount: getBooksBasedCategory().length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width / 2) / 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BooksList(book: getBooksBasedCategory()[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
