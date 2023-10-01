import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/tasks_cubit.dart';
import '../../../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(task.description),
      value: task.isCompleted,
      onChanged: (bool? value) {
        context
            .read<TasksCubit>()
            .editTask(task.id!, task.copyWith(isCompleted: value));
      },
    );
  }
}
