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
    print('*********************');
    return Container(
        child: categoryProvider.categoryList.length == 0
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
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
                              child: Text(categoryProvider
                                  .categoryList[index - 1].name),
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
        height: MediaQuery.of(context).size.height / 7);
  }
}

//  List<String> categories = ["horror", "romance", "thriller", "action", "lovestory", "abc","def"];
// bool more = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: GridView.builder(
//   itemCount: categories.length+1,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 3),
//   itemBuilder: (BuildContext context, int index) {
//     if(index == 5)
//     {
//       return GestureDetector(
//         onTap:(){
//           more = !more;
//           setState((){});
//         },
//         child: new Card(
//         child: Text(more?'Less': 'More')
//     ),
//       );
//     }
//     if(index>5)
//     {
//       return Visibility(
//         visible:more,
//         child: new Card(
//         child: Text(categories[index-1])
//     ),
//       );
//     }
//     else
//     {
//       return new Card(
//       child: Text(categories[index])
//     );
//     }
//   },
// ),
//     );
//   }

// GridView.count(
//           crossAxisCount: 3,
//           childAspectRatio: 2.5,
//           children:
//               List.generate(categoryProvider.categoryList.length, (index) {
//             print(categoryProvider.categoryList.length);
//             if (index == 5) {
//               return Container(
//                 margin: EdgeInsets.all(5),
//                 child: RaisedButton(
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("More"),
//                       Icon(Icons.add),
//                     ],
//                   ),
//                   color: Colors.blue,
//                 ),
//               );
//             }
//             return Container(
//               margin: EdgeInsets.all(5),
//               child: RaisedButton(
//                 onPressed: () {},
//                 child: Text(categoryProvider.categoryList[index].name),
//                 color: Color(0xffF2E7FE),
//               ),
//             );
//           }),
//         ),
