import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_app/models/adv.model.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/adv_home.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';
import 'package:shopify_app/widgets/home/prodect.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  ValueNotifier<List<int>> incrementNotifer = ValueNotifier<List<int>>([]);
  ValueNotifier<int> indexNotifier = ValueNotifier(0);

  void incrementCounter() {
    incrementNotifer.value.add(Random().nextInt(100));
    incrementNotifer.notifyListeners();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void dispose() {
    incrementNotifer.dispose();
    super.dispose();
  }

  void getData() async {
    await DataSeeder.loadData();
    setState(() {});
    _isLoading = false;
  }

  // static List<Adv> adv = [];
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/data/data.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     adv = (data["adv"] as List).map((e) => Adv.fromJson(e)).toList()  ;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeadlineWidget(title: 'Categories'),
          CategoriesRowHome(),
          SizedBox(
            height: 20,
          ),
          // CarouselSliderEx(items: DataSeeder.adv),
          Container(
            child: adv_carousel(),
          ),
          ProductsRowHome()
          // lisenableWidget(),
          // ElevatedButton(
          //     onPressed: () => incrementCounter(), child: Text("incre")),
          /////////////////////////////
          //     lisenableWidget2() ,
          ////////////////////////////////////
          // CarouselSliderEx(
          //   items: [
          //     'first Ad',
          //     'second Ad',
          //     'third Ad',
          //     'forth Ad',
          //   ],
          // ),
          // if (_isLoading)
          //   CircularProgressIndicator()
          // else
          //   ...DataSeeder.products.map((e) => Text(e.name ?? 'No Name')).toList()
        ],
      ),
    );
  }

  // Widget lisenableWidget() {
  //   return ValueListenableBuilder(
  //     valueListenable: incrementNotifer,
  //     builder: (BuildContext context, dynamic list, Widget? child) {
  //       return ListView.builder(
  //         shrinkWrap: true,
  //         itemBuilder: (ctx, index) => Text(list[index].toString()),
  //         itemCount: list.length,
  //       );
  //     },
  //   );
  // }
  ////////////////////
  Widget lisenableWidget2() {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, dynamic value, _) {
        return CarouselSliderEx(
          imageUrls: [
            "https://m.media-amazon.com/images/I/81S-ekaE+vS._AC_UL320_.jpg",
            "https://m.media-amazon.com/images/I/61hMQOHmEIL._AC_UL320_.jpg",
            "https://m.media-amazon.com/images/I/81b9Eh286BL._AC_UL320_.jpg",
            "https://m.media-amazon.com/images/I/61U-R3-znNL._AC_UL320_.jpg"
          ],
          onBtnPressed: () {},
        );
      },
    );
  }
}
