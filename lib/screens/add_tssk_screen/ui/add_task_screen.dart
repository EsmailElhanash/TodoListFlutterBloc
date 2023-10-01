import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/tasks_cubit.dart';
import '../../../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add task logic here
                // You can handle adding the task to your data source or store

                // Access the TasksCubit using BlocProvider
                final tasksCubit = BlocProvider.of<TasksCubit>(context);

                // Implement your task addition logic here
                // For example, you can create a Task object and add it using the cubit
                final newTask = Task(
                  description: taskNameController.text,
                  isCompleted: false,
                  id: null,
                );

                tasksCubit.addTask(newTask); // Call the cubit's addTask method

                // Navigate back to the previous screen, assuming you want to go back
                Navigator.pop(context);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
