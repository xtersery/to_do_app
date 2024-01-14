import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view_models/task_list_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListView>(builder: (_, viewModel, __) {
      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey<int>(index),
            onDismissed:(direction) {
              viewModel.deleteTask(index);
            },
            child: ListTile(
              style: ListTileStyle.list,
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              leading: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(width: 2, color: Color.fromARGB(255, 118, 118, 118)),
                ),
                value: viewModel.value(index),
                onChanged: (value) {
                  viewModel.setComplete(value!, index);
                }
                ),
              title: Text(viewModel.getTaskName(index)),
            ),
          );
        },
        separatorBuilder: (_, index) => const Divider(height: 5.0),
        itemCount: viewModel.numTasks);
    });
  }
}
