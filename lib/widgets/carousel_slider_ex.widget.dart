import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselSliderEx extends StatefulWidget {
  final List<dynamic> items;
  const CarouselSliderEx({required this.items, super.key});

  @override
  State<CarouselSliderEx> createState() => _CarouselSliderExState();
}

class _CarouselSliderExState extends State<CarouselSliderEx> {
  int currentPosition = 0;
/*
  CarouselOptions get options => CarouselOptions(
        onPageChanged: (index, _) {
          currentPosition = index;
          setState(() {});
        },
        height: 150,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      );
*/
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (index, _) {
              currentPosition = index;
              print(index);
              setState() {}
              ;
            },
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
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final uri_of_images = widget.items[index]["url"];
            print(uri_of_images);
            return Container(
                margin: EdgeInsets.all(10),
                child: Image.network(uri_of_images));
          },
          itemCount: widget.items.length,
        ),
        /*
        CarouselSlider(
          options: options,
          items: widget.items.map((i) {
            return Builder(
              builder: (BuildContext context) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Column(
                    children: [
                      //Image.network(i["url"]),
                      // : avoid_print
                      Text(
                        'text ${i.toString()}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  )),
            );
          }).toList(),
        ),






*/

        DotsIndicator(
          dotsCount: 5,
          position: currentPosition,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}
