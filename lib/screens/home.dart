import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_app/models/product.dart';
import 'package:http/http.dart' as http;


class HomeScreenController  extends GetxController{
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fechProducts();
    
  }

  Future <void> fechProducts () async{
    print("Fetching products");
    try {
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
    // if(isLoading){
    //   return const Center(child: CircularProgressIndicator());
    // }
    return  Scaffold(
    body: SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(
          horizontal: 28.0, 
          vertical: 20,),
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
          ):const Column(
          children: [
           ]
            ),
      ),
    ),
    
   );
   });
  }
}