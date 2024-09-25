import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController  extends GetxController{
  var count = 0.obs;
  void increment(){
    count.value++;
  }
  void decrement(){
    count.value--;
  }
}
class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
   return Obx(() {
    final count = controller.count.value;
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Count $count"),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.decrement, 
                child: const Text("Decrease")),
                ElevatedButton(
                onPressed: controller.increment, 
                child: const Text("Increase")),
            ],
          ),
             
        ],
      ),
    ),
   );
   });
  }
}