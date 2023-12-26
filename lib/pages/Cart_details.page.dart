import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/cart.model.dart';
import 'package:shopify_app/models/product.model.dart';
import 'package:shopify_app/providers/cart.provider.dart';
import 'package:shopify_app/widgets/button_icon.widget.dart';
import 'package:shopify_app/widgets/icon_badge.widget.dart';
import 'package:shopify_app/widgets/selected_color.dart';
import 'package:shopify_app/widgets/selected_size.widget.dart';
import 'package:uuid/uuid.dart';

class CartDetailsPage extends StatefulWidget {
  final Cart cart;
  const CartDetailsPage({required this.cart, super.key});

  @override
  State<CartDetailsPage> createState() => _CartDetailsPageState();
}

class _CartDetailsPageState extends State<CartDetailsPage> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).createItemInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Color(0xffff6969), size: 18),
        ),
        actions: [CartBadgeWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text("${widget.cart.items.toString()}"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
