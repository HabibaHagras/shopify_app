import 'package:shopify_app/seeder/data.seeder.dart';

class ProductProvider {
  Future<List<Map<String, dynamic>>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return DataSeeder.products;
  }
}
