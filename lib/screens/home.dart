import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_sample_app/models/product.dart';
import 'package:getx_sample_app/widgets/product.dart';
import 'package:http/http.dart' as http;


class HomeScreenController  extends GetxController{
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fechProducts();
    
  }

  Future <void> fechProducts () async{
    print("Fetching products");
    try {
      isLoading.toggle();
      final url = Uri.https('fakestoreapi.com','/products');
      final response = await http.get(url);
      isLoading.toggle();
      
      log(response.body);
      
      if(response.statusCode >= 200 && response.
      statusCode < 300){
        final List<dynamic> body = jsonDecode(response.body);

        for(var product in body){
          products.add(ProductModel.fromJson(product));

        }
      }
    } catch (e) {
      log("error occurred: ${e.toString()}");
    }

  }
}
class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});

  final controller = Get.put(HomeScreenController());
  

  @override
  Widget build(BuildContext context) {
   return Obx(() {
    final isLoading = controller.isLoading.value;
     final products = controller.products;
    // if(isLoading){
    //   return const Center(child: CircularProgressIndicator());
    // }
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Products", 
        style: TextStyle(
          fontWeight: FontWeight.bold
        ) ,),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
    body: SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(
          horizontal: 16.0, 
          vertical: 10,
          ),
        child: isLoading  
           ? showLoading()
          :RefreshIndicator(
            onRefresh: controller.fechProducts,
            child: MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: products.length,
              itemBuilder: (context, index)=> ProductTile(products[index])),
          )
      ),
    ),
    
   );
   });
  }
  Widget showLoading() =>
    const Center(
          child: CircularProgressIndicator(),
    );
}