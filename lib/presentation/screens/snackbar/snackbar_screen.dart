import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // REVIEW - Obliga a aceptar términos para cerrar modal
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro'),
        content: const Text(
            'Ullamco ex id aliqua eiusmod veniam cillum commodo aliqua id veniam mollit incididunt excepteur aliquip. Officia non reprehenderit ex dolore quis occaecat officia ut labore. Aute in exercitation exercitation in dolor et culpa irure. Fugiat aliqua amet dolor eiusmod veniam enim reprehenderit non consequat ea laboris fugiat sunt sint. Eiusmod aliquip aliquip velit veniam incididunt non. Fugiat culpa officia aliqua dolor elit commodo excepteur officia anim ex cupidatat sint in ex.'),
        actions: [
          // REVIEW - two example for close modal 1. go_route 2. navigator nativo
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

      // Body with Dialogo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text('In nulla commodo ut consectetur')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo'))
          ],
        ),
      ),

      // Snackbar
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
