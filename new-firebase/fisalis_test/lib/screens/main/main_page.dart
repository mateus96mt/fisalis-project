import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sketch/models/product.dart';
import 'package:sketch/screens/category/category_list_page.dart';
import 'package:sketch/screens/shop/check_out_page.dart';
import 'package:sketch/services/products.service.dart';

import '../../app_properties.dart';
import '../../custom_background.dart';
import '../profile_page.dart';
import 'components/custom_bottom_bar.dart';
import 'components/product_list.dart';
import 'components/tab_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Weekly featured', 'Best of June', 'Best of 2018'];
String selectedTimeline = 'Weekly featured';

List<Product> products = [
  Product(),
  Product(),
  Product(),
];

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  SwiperController swiperController;
  TabController tabController;
  TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);

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

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];
                    products = List.from(products.reversed);
                  });
                },
                child: Text(
                  timelines[0],
                  style: TextStyle(
                      fontSize: timelines[0] == selectedTimeline ? 20 : 14,
                      color: darkGrey),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[1];
                    products = List.from(products.reversed);
                  });
                },
                child: Text(timelines[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: timelines[1] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[2];
                    products = List.from(products.reversed);
                  });
                },
                child: Text(timelines[2],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: timelines[2] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
        body: CustomPaint(
          painter: MainBackground(),
          child: TabBarView(
            controller: bottomTabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    // These are the slivers that show up in the "outer" scroll view.
                    return <Widget>[
                      // SliverToBoxAdapter(
                      //   child: appBar,
                      // ),
                      SliverToBoxAdapter(
                        child: topHeader,
                      ),
                      SliverToBoxAdapter(
                        child: ProductList(
                          products: products,
                        ),
                      ),
                      // SliverToBoxAdapter(
                      //   child: tabBar,
                      // )
                    ];
                  },
                  body:
                      // Container()
                      TabView(
                    tabController: tabController,
                  ),
                ),
              ),
              CategoryListPage(),
              CheckOutPage(),
              ProfilePage()
            ],
          ),
        ),
      ),
    );
  }
}
