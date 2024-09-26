import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController  extends GetxController{
  var todos = <String>[].obs;
  

  late TextEditingController newTodoController;

  @override
  void onInit() {
    super.onInit();
    newTodoController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    newTodoController.dispose();
  }

  void addTodo(){
    final newTodo = newTodoController.text.trim();
    
    if(newTodo.isEmpty){
      return;
    }
    todos.add(newTodo);
    newTodoController.clear();
  }

  void removeTodo(index){
    todos.removeAt(index);
  }
  }
class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
   return Obx(() {
    final todos = controller.todos;
    return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
        child: Column(
          children: [
             Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.newTodoController,
                    decoration: const InputDecoration(
                      hintText: "Enter new todo"
                    ),
                  )),
                ElevatedButton(
                  onPressed: controller.addTodo, 
                  child: Text("Add"))
              ],
             ),
             SizedBox(height: 10,),
             Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context,index) => ListTile(
                  title: Text(todos[index]),
                ),
              ))
              ],
        
            ),
      ),
    ),
    
   );
   });
  }
}