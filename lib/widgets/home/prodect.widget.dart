import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/providers/productProvider.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/home/iteams.product.dart';

import 'package:flutter/material.dart';
import 'package:shopify_app/models/product.model.dart';
/*
class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
                color: Color(0xffe7eaf0), spreadRadius: 5, blurRadius: 10),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.url ?? '',
              width: 85,
              height: 79,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name ?? 'No Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

class ProductWidget extends StatelessWidget {
  

   ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
        future: ProductProvider().getProducts(context),
        builder: ((context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> pro = snapshot.data!;
            return SizedBox(
              height: 60,
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        child: Text(pro[index].name.toString()),
                      ),
                      Container(
                        child: Text(pro[index].description.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                  pro[index].url.toString() ?? '',

                                  // "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  );
                },
                itemCount: pro.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          return CircularProgressIndicator();
        }));
/******* 
 *  return Consumer<List>(
      builder: (BuildContext context, List<dynamic> value, _) {
        return PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  child: Text(value[index].name.toString()),
                ),
                Container(
                  child: Text(value[index].description.toString()),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: NetworkImage(
                            value[index].url.toString() ?? '',
                          ),
                          fit: BoxFit.cover)),
                ),
              ],
            );
          },
        );
      },
    );
*******/
    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 8),
    //   child: Row(
    //     children: [
    //       ProductItemRowWidget(
    //         gradientColors: [
    //           Color(0xffffa554),
    //           Color(0xfffe6953),
    //         ],
    //         imagePath: 'assets/images/clothes.png',
    //         shadowColor: Color(0xfffee0e1),
    //         title: 'Apparel',
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       ProductItemRowWidget(
    //         gradientColors: [
    //           Color(0xff56f1f9),
    //           Color(0xff69b9fe),
    //         ],
    //         imagePath: 'assets/images/beauty.png',
    //         shadowColor: Color(0xffe1efff),
    //         title: 'Beauty',
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       ProductItemRowWidget(
    //         gradientColors: [
    //           Color(0xff97f34d),
    //           Color(0xff42c441),
    //         ],
    //         imagePath: 'assets/images/shoes.png',
    //         shadowColor: Color(0xffd1f6db),
    //         title: 'Shoes',
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       ProductItemRowWidget(
    //         gradientColors: [
    //           Colors.white,
    //           Colors.white,
    //         ],
    //         iconWidget: Icon(
    //           Icons.arrow_forward_ios_outlined,
    //           size: 30,
    //           color: Colors.red,
    //         ),
    //         shadowColor: Color(0xfff2f5f9),
    //         title: 'See All',
    //       ),
    //     ],
    //   ),
    // );
  }
}
