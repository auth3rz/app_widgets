import 'package:app_widgets/menu/menu_item.dart';
import 'package:flutter/material.dart';

import 'package:app_widgets/config/responsive_size.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; 
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  var navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      
      onDestinationSelected: (value) {
        setState(() => navDrawerIndex = value);
        context.push(appMenuItems[value].link);
        widget.scaffoldKey.currentState!.closeDrawer();
      },
      
      children: [
        SizedBox(height: nh(context)),
        ...appMenuItems.map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        )),
      ]
    );
  }
}