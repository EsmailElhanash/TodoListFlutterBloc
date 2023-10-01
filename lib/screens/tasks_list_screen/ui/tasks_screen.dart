import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_with_bloc/bloc/tasks_cubit.dart';
import 'package:todo_list_with_bloc/screens/tasks_list_screen/ui/task_item.dart';

import '../../../models/task.dart';
import '../../add_tssk_screen/ui/add_task_screen.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Column(
        children: [
          // Task List
          Expanded(
            child: BlocBuilder<TasksCubit, List<Task>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length, // Number of tasks,
                  itemBuilder: (context, index) {
                    // Use the TaskItem widget here
                    return TaskItem(task: state[index]);
                  },
                );
              },
            ),
          ),
          // Add Task Button
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withOpacity(0.5), // Customize the shadow color
                spreadRadius: 5, // Adjust the spread radius for the shadow
                blurRadius: 7, // Adjust the blur radius for the shadow
                offset: const Offset(0, 3), // Adjust the offset for the shadow
              ),
            ],
          ),
          child: ClipOval(
            child: Material(
              color: Colors.blue, // Button background color
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTaskScreen()),
                  );
                },
                child: const SizedBox(
                  width: 56, // Button width and height for a circle shape
                  height: 56,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
