import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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
        title: const Text('Flutter + Material j3'),
      ),
      body: _HomeView(),
      // Menú lateral
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  // const _HomeView({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
      // icon to used the final widget
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      // Icon to used the start widget
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // NOTE - Example without named routes
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ButtonScreen(),
        // ));

        // NOTE - Example with named routes at main
        // Navigator.pushNamed(context, menuItem.link);

        // NOTE - Example with go_route
        // context.push(CardsScreen.name);
        context.push(menuItem.link);
      },
    );
  }
}
