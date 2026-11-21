import 'package:flutter/material.dart';
import 'package:pert6_firebase/services/firestore_service.dart';
import 'package:pert6_firebase/widgets/todo_dialog.dart';


import '../models/todo.dart';
import '../widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoDialog(firestoreService: _firestoreService),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: _firestoreService.getTodos(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text('No task'));
          }

          final todos = snapshot.data!;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: todos[index],
                firestoreService: _firestoreService,
              );
            },
          );
        },
      )
    );
  }
}