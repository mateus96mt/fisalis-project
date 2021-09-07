import 'package:flutter/material.dart';
import 'package:sketch/models/product.dart';
import 'package:sketch/screens/main/components/product_list.dart';
import 'package:sketch/services/products.service.dart';

import '../../../app_properties.dart';

class MoreProducts extends StatefulWidget {
  @override
  _MoreProductsState createState() => _MoreProductsState();
}

class _MoreProductsState extends State<MoreProducts> {
  final List<Product> products = [
    Product(),
    Product(),
    Product(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductServices.getClothes().then((list) {
      products.clear();
      for (var item in list) {
        products.add(item);
      }
      setState(() {});
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'More products',
            style: TextStyle(color: Colors.white, shadows: shadow),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          height: 250,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(

                  ///calculates the left and right margins
                  ///to be even with the screen margin
                  padding: index == 0
                      ? EdgeInsets.only(left: 24.0, right: 8.0)
                      : index == 4
                          ? EdgeInsets.only(right: 24.0, left: 8.0)
                          : EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(product: products[index]));
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
