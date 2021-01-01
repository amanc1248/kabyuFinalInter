import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:provider/provider.dart';



class BuildCategory extends StatefulWidget {
  @override
  _BuildCategoryState createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<BuildCategory> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    print(categoryProvider.categoryList.length);
    return categoryProvider.categoryList.length == 0
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categoryProvider.categoryList.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2.5),
              itemBuilder: (BuildContext context, int index) {
                if (index == 5) {
                  return GestureDetector(
                    onTap: () {
                      more = !more;
                      setState(() {});
                    },
                    child: new Container(
                        color: Color(0xff3700B3),
                        margin: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          more ? 'Less -' : 'More +',
                          style: TextStyle(color: Colors.white),
                        ))),
                  );
                }
                if (index > 5) {
                  return Visibility(
                      visible: more,
                      child: new Container(
                        color: Color(0xffF2E7FE),
                        margin: EdgeInsets.all(5),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                                categoryProvider.categoryList[index - 1].name),
                          ),
                        ),
                      ));
                } else {
                  return new Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(categoryProvider.categoryList[index].name),
                      color: Color(0xffF2E7FE),
                    ),
                  );
                }
              },
            ),
          );
  }
}
