import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/adv.model.dart';
import 'package:shopify_app/seeder/data.seeder.dart';

class adv_carousel extends StatelessWidget {
  const adv_carousel({super.key, required this.adv});
  final Adv adv;
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
              adv.url ?? '',
              width: 85,
              height: 79,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                adv.description ?? 'No Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          adv.url ?? '',

                          // "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








/** 


class adv_carousel extends StatelessWidget {
  const adv_carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>?>(
        future: DataSeeder.fetchadv(),
        builder: ((context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> adv = snapshot.data!;
            return CarouselSlider.builder(
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    child: Column(
                      children: [
                       
Container(
  alignment: Alignment.center,
  child: Container(
  
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    image: DecorationImage(
      image: NetworkImage(
                                  adv[index].url.toString() ?? '',

        // "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
      ), fit: BoxFit.cover)
    ),
  ),     
  
),
Text(adv[index].description.toString())
                          
                          
                          
                          
                          // adv[0].url ?? '',

                          // height: 150,
                        
                      ],
                    ),
                  );
                },
                itemCount: adv.length,
                options: CarouselOptions(
                  onPageChanged: (index, _) {},
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ));
          }
          return CircularProgressIndicator();
        }));
  }
}

getadv() {}
**/