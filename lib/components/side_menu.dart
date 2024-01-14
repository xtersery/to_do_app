import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/routes/app_router.gr.dart';


@RoutePage()
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<String> categories = <String>['Home', 'Work', 'Buy', 'Regular', 'Ideas'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          width: 288,
          height: double.infinity,
          color: const Color(0xFF17203A),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 32)),
              ListTile(
                trailing: const Icon(
                  Icons.cloud_download_outlined,
                  color: Colors.white),
                leading: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white),
                onPressed: () {
                  //AutoRouter.of(context).push(const SettingsRoute());
                },
                ),
              ),
              const Divider(height: 16.0,),
              ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 2.0,
                      backgroundColor: Colors.yellow
                      ),
                    title: Text(categories[index], style: const TextStyle(color: Colors.white)),
                  );
                })
              ],
          ),
        )
      );
  }
}
