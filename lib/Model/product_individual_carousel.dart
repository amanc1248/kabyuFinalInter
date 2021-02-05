import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kabyu_feather_webs/Model/product.dart';
import 'package:kabyu_feather_webs/Provider/ProductsProvider/productsProvider.dart';
import 'package:provider/provider.dart';

ProductProvider productProvider;

class ProductCarousel extends StatelessWidget {
  final Product myCarouselImage;

  ProductCarousel({this.myCarouselImage});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [myCarouselImage.image];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: item != null
                    ? Container(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        height: 208,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            '${myCarouselImage.title[0]}'.toUpperCase(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
              ),
            ))
        .toList();
    productProvider = Provider.of<ProductProvider>(context);
    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1 / 1,
            height: 208,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ],
    ));
  }
}
