import 'dart:convert';
import 'package:flutter/material.dart';


import 'package:flutter_tags/flutter_tags.dart';

class ProductTags extends StatefulWidget {
  @override
  _ProductTagsState createState() => _ProductTagsState();
}

class _ProductTagsState extends State<ProductTags> {
  // List tags = new List();
  final List<String> _list = [
    '0',
    'SDK',
    'plugin updates',
    'Facebook',
  ];

  bool _symmetry = false;
  bool _removeButton = true;
  bool _singleItem = false;

  // int _count = 0;
  int _column = 0;
  double _fontSize = 14;

  // String _itemCombine = 'withTextBefore';

  // String _onPressed = '';

  // List _icon = [Icons.home, Icons.language, Icons.headset];

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);
    // _scrollViewController = ScrollController();

    _items = _list.toList();
  }

  List _items;

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  // final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Tags(
    //       key: _globalKey,
    //       itemCount: tags.length,
    //       columns: 6,
    // textField: TagsTextField(
    //     textStyle: TextStyle(fontSize: 14),
    //     onSubmitted: (string) {
    //       setState(() {
    //         tags.add(Item(title: string));
    //       });
    //     }),
    //       itemBuilder: (index) {
    //         final Item currentItem = tags[index];
    //         return ItemTags(
    //           index: index,
    //           title: currentItem.title,
    //           customData: currentItem.customData,
    //           textStyle: TextStyle(fontSize: 14),
    //           combine: ItemTagsCombine.withTextBefore,
    //           onLongPressed: (i) => print(i),
    //           removeButton: ItemTagsRemoveButton(
    //             onRemoved: () {
    //               setState(
    //                 () {
    //                   tags.removeAt(index);
    //                 },
    //               );
    //               return true;
    //             },
    //           ),
    //         );
    //       }),
    // );
    return Tags(
      key: _tagStateKey,
      symmetry: _symmetry,
      columns: _column,
      // horizontalScroll: _horizontalScroll,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: _items.length,
      textField: TagsTextField(
          textStyle: TextStyle(fontSize: 14),
          onSubmitted: (string) {
            setState(() {
              _items.add(Item(title: string));
            });
          }),
      itemBuilder: (index) {
        final item = _items[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          activeColor: Colors.blueGrey[600],
          singleItem: _singleItem,
          splashColor: Colors.green,
          combine: ItemTagsCombine.withTextBefore,
          removeButton: _removeButton
              ? ItemTagsRemoveButton(
                  onRemoved: () {
                    setState(() {
                      _items.removeAt(index);
                    });
                    return true;
                  },
                )
              : null,
          textScaleFactor:
              utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          textStyle: TextStyle(
            fontSize: _fontSize,
          ),
          onPressed: (item) => print(item),
        );
      },
    );
  }
}
