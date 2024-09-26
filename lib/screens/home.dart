import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample_app/models/todo.dart';

class HomeScreenController  extends GetxController{
  var todos = <TodoModel>[].obs;
  

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
    todos.add(TodoModel(title: newTodo));
    newTodoController.clear();
  }

  void removeTodo(index){
    todos.removeAt(index);
  }


  void toggleTodo(index){
    final previousTodo = todos[index];
    todos[index] = TodoModel(title: previousTodo.title,
    isDone: !previousTodo.isDone);
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
                    maxLength: 100,
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
                itemBuilder: (context,index) {
                  final todo = todos[index];
                  return Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                      controller.toggleTodo(index), 
                      icon:  Icon(
                      todo.isDone 
                      ? Icons.check_box
                      :Icons.check_box_outline_blank)),
                        SizedBox(height: 5,),
                        Text(todo.title)
                  ],
                );
                }
              ))
              ],
        
            ),
      ),
    ),
    
   );
   });
  }
}