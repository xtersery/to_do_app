import 'package:flutter/material.dart';
import '../../models/models.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({
    super.key,
    required this.habit
  });

  final Habit habit;

  @override
  State<HabitScreen> createState() =>
  HabitScreenState();
}

class HabitScreenState extends State<HabitScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Text(
          widget.habit.name,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}
