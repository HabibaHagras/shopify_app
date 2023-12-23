import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shopify_app/models/category.model.dart';
import 'package:shopify_app/providers/category.provider.dart';

class CategoryItemRowWidget extends StatelessWidget {
  final CategoryData categoryData;
  Widget? iconWidget;
  CategoryItemRowWidget({
    required this.categoryData,
    this.iconWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().getCategories(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> categoryData = snapshot.data!;
            return Column(
              children: [
                PageView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ], shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: categoryData[index].title != null ? 10 : 0),
                        child: Center(
                          child: iconWidget != null
                              ? const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : Text(
                                  categoryData[index].description.toString() ??
                                      '',
                                ),
                        ),
                      ),
                    );
                  },
                  itemCount: categoryData.length,
                  scrollDirection: Axis.horizontal,
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            );
          }

          return CircularProgressIndicator();
        });
  }

/*
class ProductItemRowWidget extends StatelessWidget {
  final Color shadowColor;
  final List<Color> gradientColors;
  String? imagePath;
  Widget? iconWidget;
  final String title;
  ProductItemRowWidget(
      {required this.shadowColor,
      required this.gradientColors,
      this.imagePath,
      this.iconWidget,
      required this.title,
      super.key})
      : assert(imagePath != null || iconWidget != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: shadowColor,
                    offset: const Offset(0, 10),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: gradientColors),
              shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.only(top: imagePath != null ? 10 : 0),
            child: Center(
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    )
                  : iconWidget,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff515C6F)),
        )
      ],
    );
  }
}
*/
}
