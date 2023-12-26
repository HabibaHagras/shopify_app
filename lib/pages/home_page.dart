import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_app/models/adv.model.dart';
import 'package:shopify_app/pages/product_page.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/adv_home.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';
import 'package:shopify_app/widgets/home/prodect.widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/providers/app_auth.provider.dart';
import 'package:shopify_app/providers/category.provider.dart';
import 'package:shopify_app/providers/productProvider.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';
import 'package:shopify_app/widgets/home/category_item_row.home.widget.dart';
import 'package:shopify_app/widgets/home/prodect.widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/providers/app_auth.provider.dart';
import 'package:shopify_app/providers/category.provider.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeadlineWidget(title: 'Categories'),

            Consumer<CategoryProvider>(
              builder: (__, caegoryProvider, _) {
                return FutureBuilder(
                    future: caegoryProvider.getCategories(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return CategoriesRowHome(
                            categories: snapshot.data ?? [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),
            const SizedBox(
              height: 20,
            ),

            const HeadlineWidget(title: 'Latest'),
            const SizedBox(
              height: 10,
            ),

            const HeadlineWidget(title: 'Products'),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductProvider>(
              builder: (__, productProvider, _) {
                return FutureBuilder(
                    future: productProvider.getProducts(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return FlexibleGridView(
                            axisCount: GridLayoutEnum.threeElementsInRow,
                            shrinkWrap: true,
                            children: snapshot.data
                                    ?.map((e) => ProductWidget(
                                          product: e,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ProductDetailsPage(
                                                          product: e,
                                                        )));
                                          },
                                        ))
                                    .toList() ??
                                [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),

            ElevatedButton(
                onPressed: () =>
                    Provider.of<AppAuthProvider>(context, listen: false)
                        .onLogout(context),
                child: Text('LogOut')),
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    withData: true,
                    type: FileType.image,
                  );
                  var refrence = FirebaseStorage.instance
                      .ref('products/${result?.files.first.name}');

                  if (result?.files.first.bytes != null) {
                    var uploadResult = await refrence.putData(
                        result!.files.first.bytes!,
                        SettableMetadata(contentType: 'image/png'));

                    if (uploadResult.state == TaskState.success) {
                      print(
                          '>>>>>>>>>>>>>>>>${await refrence.getDownloadURL()}');
                    }
                  }
                },
                child: Text('upload image')),
            // CarouselSlider.builder(
            //   itemBuilder: (ctx, index, _) {
            //     return Container(
            //         width: 500,
            //         margin: EdgeInsets.symmetric(horizontal: 5.0),
            //         decoration: BoxDecoration(color: Colors.amber),
            //         child: Image.network(DataSeeder.ads[index].picture!));
            //   },
            //   itemCount: DataSeeder.ads.length,

            //   options: CarouselOptions(height: 200.0),
            //   // items: DataSeeder.ads.map((ad) {
            //   //   return Container(
            //   //       width: 500,
            //   //       margin: EdgeInsets.symmetric(horizontal: 5.0),
            //   //       decoration: BoxDecoration(color: Colors.amber),
            //   //       child: Image.network(ad.picture!));
            //   // }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
/*
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeadlineWidget(title: 'Categories'),

            Consumer<CategoryProvider>(
              builder: (__, caegoryProvider, _) {
                return FutureBuilder(
                    future: caegoryProvider.getCategories(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return CategoriesRowHome(
                            categories: snapshot.data ?? [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),
            const SizedBox(
              height: 20,
            ),

            const HeadlineWidget(title: 'Latest'),
            const SizedBox(
              height: 10,
            ),

            const HeadlineWidget(title: 'Products'),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductProvider>(
              builder: (__, productProvider, _) {
                return FutureBuilder(
                    future: productProvider.getProducts(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return FlexibleGridView(
                            axisCount: GridLayoutEnum.threeElementsInRow,
                            shrinkWrap: true,
                            children: snapshot.data
                                    ?.map((e) => ProductWidget())
                                    .toList() ??
                                [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),

            ElevatedButton(
                onPressed: () =>
                    Provider.of<AppAuthProvider>(context, listen: false)
                        .onLogout(context),
                child: Text('LogOut')),
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    withData: true,
                    type: FileType.image,
                  );
                  var refrence = FirebaseStorage.instance
                      .ref('products/${result?.files.first.name}');

                  if (result?.files.first.bytes != null) {
                    var uploadResult = await refrence.putData(
                        result!.files.first.bytes!,
                        SettableMetadata(contentType: 'image/png'));

                    if (uploadResult.state == TaskState.success) {
                      print(
                          '>>>>>>>>>>>>>>>>${await refrence.getDownloadURL()}');
                    }
                  }
                },
                child: Text('upload image')),
            // CarouselSlider.builder(
            //   itemBuilder: (ctx, index, _) {
            //     return Container(
            //         width: 500,
            //         margin: EdgeInsets.symmetric(horizontal: 5.0),
            //         decoration: BoxDecoration(color: Colors.amber),
            //         child: Image.network(DataSeeder.ads[index].picture!));
            //   },
            //   itemCount: DataSeeder.ads.length,

            //   options: CarouselOptions(height: 200.0),
            //   // items: DataSeeder.ads.map((ad) {
            //   //   return Container(
            //   //       width: 500,
            //   //       margin: EdgeInsets.symmetric(horizontal: 5.0),
            //   //       decoration: BoxDecoration(color: Colors.amber),
            //   //       child: Image.network(ad.picture!));
            //   // }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}

/*
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
            child: adv_carousel(adv: null,),
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
*/
*/