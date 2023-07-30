import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop()),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width:
          double.infinity, // cuidado con esto no aplica en todos los contextos
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10, // espacio entre elementos
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            /// Botones tipo ElevatedButton
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),

            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disabled')),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),

            /// Botones tipo FilledButton
            FilledButton(onPressed: () {}, child: const Text('Filled')),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new),
              label: const Text('Filled Icon'),
            ),

            FilledButton.tonal(
                onPressed: () {}, child: const Text('Filled Tonal')),

            /// Botones tipo OutlinedButton
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined Icon'),
            ),

            /// Botones tipo Text
            TextButton(onPressed: () {}, child: const Text('Text Button')),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_rounded),
              label: const Text('Outlined Icon'),
            ),

            /// Botones tipo Icon

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              // style: ButtonStyle(
              // backgroundColor: MaterialStatePropertyAll(colors.primary)),
              style: IconButton.styleFrom(backgroundColor: colors.primary),
            ),

            IconButton(
              onPressed: null,
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(
                    Colors.white,
                  )),
              // style: IconButton.styleFrom(backgroundColor: colors.primary),
            ),

            IconButton(
              onPressed: null,
              color: Colors.white,
              icon: const Icon(Icons.app_registration_rounded),
              // style: ButtonStyle(
              // backgroundColor: MaterialStatePropertyAll(colors.primary)),
              style: IconButton.styleFrom(backgroundColor: colors.primary),
            ),

            /// Custom Button
            ///
            const CustomButton(),
          ],
        ), // similar a row y column
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
          // definir aspectos
          color: colors.primary,
          child: InkWell(
            splashColor: Colors.blueGrey,
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola Mundo', style: TextStyle(color: Colors.white),),
            ),
          )),
    );
  }
}
