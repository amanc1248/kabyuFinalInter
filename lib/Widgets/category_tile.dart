// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class CategoryTiles extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       child: ExpandableNotifier(
//         child: ScrollOnExpand(
//           child: Container(
//             child: ExpandablePanel(
//               header: RaisedButton(
//                 onPressed: () {},
//                 child: Row(
//                   children: [
//                     ExpandableIcon(
//                       theme: const ExpandableThemeData(

//                         iconColor: Colors.white,
//                         iconSize: 28.0,
//                         iconRotationAngle: math.pi / 2,
//                         iconPadding: EdgeInsets.only(right: 5),
//                         hasIcon: false,
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         "more",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               expanded: Container(
//                 child: GridView.count(
//                   crossAxisCount: 3,
//                   children: [
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     ),
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     ),
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     ),
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     ),
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     ),
//                     RaisedButton(
//                       onPressed: () {},
//                       child: Text("Thriller"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     return ExpandableTheme(
//       data: const ExpandableThemeData(
//         iconColor: Colors.blue,
//         useInkWell: true,
//       ),
//       child: SingleChildScrollView(
//         child: ExpandableNotifier(
//             child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: ScrollOnExpand(
//             child: Card(
//               clipBehavior: Clip.antiAlias,
//               child: Column(
//                 children: <Widget>[
//                   ExpandablePanel(
//                     theme: const ExpandableThemeData(
//                       headerAlignment: ExpandablePanelHeaderAlignment.center,
//                       tapBodyToExpand: true,
//                       tapBodyToCollapse: true,
//                       hasIcon: false,
//                     ),
//                     header: Container(
//                       color: Colors.indigoAccent,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             ExpandableIcon(
//                               theme: const ExpandableThemeData(
//                                 expandIcon: Icons.arrow_right,
//                                 collapseIcon: Icons.arrow_drop_down,
//                                 iconColor: Colors.white,
//                                 iconSize: 28.0,
//                                 iconRotationAngle: math.pi / 2,
//                                 iconPadding: EdgeInsets.only(right: 5),
//                                 hasIcon: false,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 "Items",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .body2
//                                     .copyWith(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     expanded: Container(
//                       child: GridView.count(
//                         crossAxisCount: 3,
//                         children: [
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           ),
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           ),
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           ),
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           ),
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           ),
//                           RaisedButton(
//                             onPressed: () {},
//                             child: Text("Thriller"),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )),
//       ),
//     );
//   }
// }
