import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sketch/models/product.dart';
import 'package:sketch/screens/product/product_page.dart';
import 'package:sketch/services/products.service.dart';

import '../../../app_properties.dart';
import '../../../utils.dart';

class RecommendedList extends StatefulWidget {
  @override
  _RecommendedListState createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  List<Product> products = [
    Product(),
    Product(),
    Product(),
    Product(),
    Product(),
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
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Colors.grey[500], Colors.grey[700]],
                          center: Alignment(0, 0),
                          radius: 0.6,
                          focal: Alignment(0, 0),
                          focalRadius: 0.1),
                    ),
                    child: Hero(
                      tag: products[index].imageURL == ''
                          ? getRandomString(15)
                          : products[index].imageURL,
                      child: products[index].imageURL == ''
                          ? SpinKitDualRing(
                              color: Colors.black,
                            )
                          : Image.network(
                              products[index].imageURL,
                            ),
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
