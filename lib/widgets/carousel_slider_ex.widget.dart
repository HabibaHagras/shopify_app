import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselSliderEx extends StatefulWidget {
  const CarouselSliderEx(
      {required this.imageUrls, required this.onBtnPressed, super.key});

  final List<String> imageUrls;
  final void Function() onBtnPressed;

  @override
  State<CarouselSliderEx> createState() => _CarouselSliderExState();
}

class _CarouselSliderExState extends State<CarouselSliderEx> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: widget.imageUrls.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                buildSliderImage(index),
            options: CarouselOptions(
              height: 200,
              viewportFraction: .9,
              padEnds: false,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
              onPageChanged: (index, _) {
                index = index;
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
            )),
        const SizedBox(
          height: 5,
        ),
        // AnimatedSmoothIndicator(
        //   activeIndex: index,
        //   count: widget.imageUrls.length,
        //   effect: const ExpandingDotsEffect(
        //     activeDotColor: Colors.orange,
        //   ),
        // )
      ],
    );
  }

  Widget buildSliderImage(int index) {
    print(widget.imageUrls[index]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.black)
        ),
        child: Stack(
          children: [
            Image.network(
              widget.imageUrls[index],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Positioned(
                left: 20,
                top: 40,
                child: Text(
                  'New Offers',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  // maxLines: 3,
                  // textDirection: TextDirection.rtl,
                  //  textAlign: TextAlign.justify,  overflow: TextOverflow.clip,
                )),
            // Positioned(
            //   left: 20,
            //   bottom: 20,
            //   child: CustomButton(
            //     text: "SEE MORE",
            //     onBtnPressed: widget.onBtnPressed,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}









// class CarouselSliderEx extends StatefulWidget {
//   final List<dynamic> items;
//   const CarouselSliderEx({required this.items, super.key});

//   @override
//   State<CarouselSliderEx> createState() => _CarouselSliderExState();
// }

// class _CarouselSliderExState extends State<CarouselSliderEx> {
//   int currentPosition = 0;
// /*
//   CarouselOptions get options => CarouselOptions(
//         onPageChanged: (index, _) {
//           currentPosition = index;
//           setState(() {});
//         },
//         height: 150,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 3),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 0.3,
//         scrollDirection: Axis.horizontal,
//       );
// */
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         CarouselSlider.builder(
//           options: CarouselOptions(
//             onPageChanged: (index, _) {
//               currentPosition = index;
//               print(index);
//               setState() {}
//               ;
//             },
//             height: 200,
//             aspectRatio: 16 / 9,
//             viewportFraction: 0.8,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: Duration(seconds: 3),
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             enlargeFactor: 0.3,
//             scrollDirection: Axis.horizontal,
//           ),
//           itemBuilder: (BuildContext context, int index, int realIndex) {
//             final uri_of_images = widget.items[index];
//             print(uri_of_images);
//             return Container(
//                 margin: EdgeInsets.all(10),
//                 child: Image.network(uri_of_images));
//           },
//           itemCount: widget.items.length,
//         ),
//         /*
//         CarouselSlider(
//           options: options,
//           items: widget.items.map((i) {
//             return Builder(
//               builder: (BuildContext context) => Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   decoration: BoxDecoration(color: Colors.amber),
//                   child: Column(
//                     children: [
//                       //Image.network(i["url"]),
//                       // : avoid_print
//                       Text(
//                         'text ${i.toString()}',
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                     ],
//                   )),
//             );
//           }).toList(),
//         ),






// */

//         DotsIndicator(
//           dotsCount: 5,
//           position: currentPosition,
//           decorator: DotsDecorator(
//             size: const Size.square(9.0),
//             activeSize: const Size(18.0, 9.0),
//             activeShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0)),
//           ),
//         )
//       ],
//     );
//   }
// }
