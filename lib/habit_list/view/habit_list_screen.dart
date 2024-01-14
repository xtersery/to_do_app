import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/components.dart';
import 'package:to_do_app/components/task_bottom_sheet.dart';
import 'package:to_do_app/view_models/task_list_model.dart';

class HabitScreen extends StatefulWidget {
  final Function() onSideBar;

  const HabitScreen({super.key, required this.onSideBar});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final appbar = AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(50.0, MediaQuery.of(context).viewPadding.top, 50.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu_open_sharp),
                onPressed: () => widget.onSideBar(),
              ),
              const Icon(Icons.calendar_today),
            ],
            ),
        ),
      );
    final appbarHeight = appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    final bodyHeight = MediaQuery.of(context).size.height - appbarHeight;
    return Scaffold(
      appBar: appbar,
      body: Builder(
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            height: bodyHeight * 0.7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  ListTile(
                    style: theme.listTileTheme.style,
                    title: const Text(
                      "TODAY",
                      style: TextStyle(color: Color.fromARGB(255, 107, 112, 255)),
                    )
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: TaskList()),
                  ListTile(
                    style: theme.listTileTheme.style,
                    title: const Text(
                      "TOMMOROW",
                      style: TextStyle(
                        color: Color.fromARGB(255, 92, 92, 92),
                      ),
                    )
                  ),
                  ListTile(
                    style: theme.listTileTheme.style,
                    title: Text(
                      "ON THE WEEK",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ),
                  ListTile(
                    style: theme.listTileTheme.style,
                    title: Text(
                      "LATER",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ),
                ],
              ),
          );
        }
      ),
      floatingActionButton: Consumer<TaskListView>(builder: (_, viewModel, __) {
        return ExpandableFAB(
          distance: 60,
          children: [
            MenuButton(
              icon: const Icon(Icons.adjust),
              onPressed:() => {},
              ),
            MenuButton(
                icon: const Icon(Icons.restart_alt_sharp),
                onPressed:() {
                  viewModel.bottomSheetBuilder(const AddTaskBottomSheet(), context);
                  }),
          ],
        );
      }
    )
    );
  }
}
