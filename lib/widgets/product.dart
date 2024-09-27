import 'package:flutter/material.dart';
import 'package:getx_sample_app/models/product.dart';

class ProductTile extends StatelessWidget{
  final ProductModel product;
  const ProductTile(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white,
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(product.image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(product.title),
              Text('\$${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),)
            ],
          ),
        )
      ],
     ),
   );
  }
}