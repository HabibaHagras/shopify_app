import 'package:flutter/material.dart';
import 'package:shopify_app/models/category.model.dart';
import 'package:shopify_app/widgets/home/category_item_row.home.widget.dart';

class CategoriesRowHome extends StatelessWidget {
  final List<CategoryData> categories;
  const CategoriesRowHome({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ...categories.map((category) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CategoryItemRowWidget(
                  categoryData: category,
                ),
              )),
          CategoryItemRowWidget(
            categoryData: CategoryData()
              ..title = 'See More',
            
            iconWidget: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 30,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:shopify_app/widgets/home/category_item_row.home.widget.dart';

class CategoriesRowHome extends StatelessWidget {
  const CategoriesRowHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ProductItemRowWidget(
            gradientColors: [
              Color(0xffffa554),
              Color(0xfffe6953),
            ],
            imagePath: 'assets/images/clothes.png',
            shadowColor: Color(0xfffee0e1),
            title: 'Apparel',
          ),
          const SizedBox(
            width: 20,
          ),
          ProductItemRowWidget(
            gradientColors: [
              Color(0xff56f1f9),
              Color(0xff69b9fe),
            ],
            imagePath: 'assets/images/beauty.png',
            shadowColor: Color(0xffe1efff),
            title: 'Beauty',
          ),
          const SizedBox(
            width: 20,
          ),
          ProductItemRowWidget(
            gradientColors: [
              Color(0xff97f34d),
              Color(0xff42c441),
            ],
            imagePath: 'assets/images/shoes.png',
            shadowColor: Color(0xffd1f6db),
            title: 'Shoes',
          ),
          const SizedBox(
            width: 20,
          ),
          ProductItemRowWidget(
            gradientColors: [
              Colors.white,
              Colors.white,
            ],
            iconWidget: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 30,
              color: Colors.red,
            ),
            shadowColor: Color(0xfff2f5f9),
            title: 'See All',
          ),
        ],
      ),
    );
  }
}
*/