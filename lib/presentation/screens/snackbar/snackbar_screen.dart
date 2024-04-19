import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//  DESC - On this screen have the modals

class SnackbarScreen extends StatelessWidget {

  // Para utilizar rutas con nombre de go-router
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void openDialogLicenses(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Obliga dark click a uno de los botones para cerrar
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

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('hola mundo soy un snackbar'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

      // Body with Licenses and Dialogs
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Native dialog
            FilledButton.tonal(
                onPressed: () {
                  // El titulo de este dialog viene del title de main
                  showAboutDialog(
                    context: context,
                    children: [
                    const Text('Este showAboutDialog nativo de flutter permite ver licencias de paquetes que usa')
                  ]);
                },
                child: const Text('Mostrar diálogo')),

            // Custom dialog
            FilledButton.tonal(
                onPressed: () => openDialogLicenses(context),
                child: const Text('Licencias usadas')),
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
