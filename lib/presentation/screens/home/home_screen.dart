import 'package:app_widgets/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:app_widgets/menu/menu_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String name = 'Home screen';
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey)
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (BuildContext context, int index) {
          final elItem = appMenuItems[index];
          return ListTile(
            title: Text(elItem.title),
            subtitle: Text(elItem.subTitle),
            leading: Icon(elItem.icon),
            trailing: const Icon(Icons.arrow_right),
            onTap: () => context.push(elItem.link),
          );
        },
      ),
    );
  }
}