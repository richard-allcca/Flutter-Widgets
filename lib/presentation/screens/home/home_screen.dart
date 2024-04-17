import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  // Para utilizar rutas con nombre de go-router
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Obtiene es estado actual del scaffold
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // centerTitle: true ,
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
      // Menú lateral
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    // super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      // icon to used the start widget
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      // Icon to used the final widget
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // NOTE - Example 1 to navigate to other screen without named routes
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ButtonScreen(),
        // ));

        // NOTE - Example 2 to navigate to other screen with named routes at main
        // Navigator.pushNamed(context, menuItem.link);

        // NOTE - Example to navigate to other screen with go_route
        // To navigate with named route, the name is missing from each menu item
        // context.pushNamed(CardsScreen.name);

        context.push(menuItem.link); // To navigate with link route
      },
    );
  }
}
