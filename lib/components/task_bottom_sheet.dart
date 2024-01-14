import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view_models/task_list_model.dart';
import 'package:to_do_app/models/models.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController.fromValue(null);
    return Consumer<TaskListView>(
      builder: (_, viewModel, __) {
        return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          color: Colors.white,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
              onSubmitted:(value) {
                if (controller.text.isNotEmpty) {
                  viewModel.addTask(Task(name: controller.text));
                  controller.clear();
                }
              },
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 234, 234, 234),
                filled: true,
                contentPadding: const EdgeInsets.only(bottom: 5.0),
                border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
              ),
              controller: controller,
              autofocus: true,
              autocorrect: false,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
              ),
            ),
          ),
        ),
        );
      }
    );
  }
}
