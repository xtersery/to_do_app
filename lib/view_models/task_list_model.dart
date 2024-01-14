import 'package:flutter/material.dart';
import 'package:to_do_app/models/models.dart';

class TaskListView extends ChangeNotifier {
  List<Task> tasks = <Task>[];

  int get numTasks => tasks.length;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void setComplete(bool value, int taskIndex) {
    tasks[taskIndex].checked = value;
    notifyListeners();

  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  String getTaskName(int taskIndex) => tasks[taskIndex].name;

  bool value(int taskIndex) => tasks[taskIndex].checked;

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return bottomSheetView;
    }
    );
  }
}
