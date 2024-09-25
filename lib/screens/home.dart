import 'package:flutter/material.dart';
import 'package:get/get.dart';

var count = 0.obs;
var steps = 1.obs;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  count.value = count.value - steps.value;
                }, 
                child: const Text("Decrease")),
                ElevatedButton(
                onPressed: (){
                  count.value = steps.value + count.value;
                }, 
                child: const Text("Increase")),
            ],
          ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  steps.value--;
                }, 
                child: const Text("Decrease Step")),
                ElevatedButton(
                onPressed: (){
                  steps.value++;
                }, 
                child: const Text("Increase Step")),
            ],
          ),
          Text("Steps ${steps.value}")
        ],
      ),
    ),
   );
   });
  }
}