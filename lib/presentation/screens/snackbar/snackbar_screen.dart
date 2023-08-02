import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo !'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // Evitar que pueda cerrar el dialogs si da clic afuera del modal
        builder: (context) =>  AlertDialog(
              title: const Text('Estas Seguro ?'),
              content: const Text(
                  'Sint occaecat ea dolor tempor et esse ea velit fugiat do anim. Irure sunt sunt occaecat qui est sint. Aliqua id non occaecat sint dolor qui. Veniam laborum pariatur reprehenderit amet. Duis ipsum eiusmod pariatur nisi sit velit irure magna voluptate occaecat aliqua non ullamco et.'),
              actions: [
                TextButton(onPressed: () => context.pop(), child:  const Text('Cancelar')),


                FilledButton(onPressed: () => context.pop(), child:  const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialog`s'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () => openDialog(context), child: const Text('Mostrar Dialog')),
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Ut irure voluptate sit esse Lorem ipsum irure ipsum magna elit esse et duis eu. Laborum exercitation officia sit non mollit est anim. Ipsum nulla occaecat in minim eu ullamco do qui incididunt ea sunt velit et. Ad ex amet enim est cillum labore eu aute exercitation ea mollit. Occaecat elit dolor esse eu nulla nostrud Lorem veniam. Qui labore et fugiat nulla dolor quis.')
                  ]);
                },
                child: const Text('Licencias Usadas')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.add_to_home_screen),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
