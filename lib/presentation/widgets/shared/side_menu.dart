import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Notch - this is the space on top of screen
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(

      // SECTION - management of the state and events of menu items

      selectedIndex: navDrawerIndex, // Index of menu selected
      onDestinationSelected: (value) { // Update state with option selected
        setState(() {
          navDrawerIndex = value;
        });

        // Get item of menu selected to navigate
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        // Method to closing the menu when return to home
        widget.scaffoldKey.currentState?.closeDrawer();
      },

      // SECTION - Items of menu

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
        ),
        ...appMenuItems
        .sublist(0,3)
        .map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
        .sublist(3)
        .map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
      ],
    );
  }
}
