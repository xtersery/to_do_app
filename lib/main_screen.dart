import 'package:flutter/material.dart';
import 'package:to_do_app/components/components.dart';
import 'package:to_do_app/habit_list/view/habit_list_screen.dart';
import 'package:to_do_app/task_list/view/task_list_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  bool isSideBarClosed = true;

  void _onSideBarOpen() {
    setState(() {
      isSideBarClosed = !isSideBarClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform.translate(
            offset: Offset(isSideBarClosed ? 0 : 288, 0),
            child: HabitScreen(onSideBar: _onSideBarOpen),
            ),
        ],
      ),
    );
  }
}
