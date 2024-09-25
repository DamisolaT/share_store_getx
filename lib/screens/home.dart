import 'package:flutter/material.dart';
import 'package:get/get.dart';

var count = 0.obs;


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Obx(() {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Count ${count.value}"),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              count.value = count.value +1;
            }, 
            child: const Text("Increase")),
             ElevatedButton(
            onPressed: (){
              count.value--;
            }, 
            child: const Text("Decrease")),
            
        ],
      ),
    ),
   );
   });
  }
}