import 'package:flutter/material.dart';
import 'package:to_do_app/components/components.dart';
import 'package:to_do_app/main_screen.dart';
import 'package:to_do_app/routes/app_router.dart';
import 'package:to_do_app/theme/darkTheme.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view_models/task_list_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskListView(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //AppRouter appRouter = AppRouter();
    return MaterialApp(
    //MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ToDoApp',
      theme: darkTheme,
      home: const EntryPoint(),
      //routerConfig: appRouter.config(),
    );
  }
}
