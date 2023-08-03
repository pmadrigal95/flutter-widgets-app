import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;

  final String caption;

  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Sint dolor esse ea deserunt esse fugiat. Nostrud ullamco culpa est irure qui in deserunt Lorem incididunt. Incididunt quis laborum laborum mollit amet aliqua pariatur anim culpa dolore. Proident culpa sit eu enim qui esse labore amet reprehenderit consectetur. Nulla officia qui sint ad nostrud consectetur tempor culpa duis esse anim veniam.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rápida',
      caption:
          'Dolor ex enim et excepteur eiusmod excepteur excepteur laborum deserunt reprehenderit exercitation Lorem amet. Adipisicing occaecat ex velit pariatur. Veniam consequat aliqua in consequat velit aliquip id amet mollit ex cillum dolor. Ullamco deserunt tempor non reprehenderit ullamco eiusmod occaecat dolor fugiat occaecat sunt anim. Sint in eiusmod ipsum laborum excepteur nulla excepteur labore ad aute qui ipsum.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Mollit anim incididunt consectetur culpa dolor ullamco sunt sint. Nulla labore ad labore ad laboris occaecat est non Lorem veniam. Excepteur ad aute nisi nulla. Sint qui sit ut ex aliqua dolore voluptate. Enim enim excepteur sit esse minim cupidatat amet et consectetur nulla excepteur consequat ipsum et. Cillum irure proident ipsum quis consectetur ullamco est excepteur mollit aliquip anim. Do id nisi duis laboris et.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose(); // Liberar memoria

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),

          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 40,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox(), // SizedBox se recomienda cuando no se va a pintar el widget
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;

  final String caption;

  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Ajuste en el centro de la app
          crossAxisAlignment:
              CrossAxisAlignment.start, // Ajuste justificado de los elementos
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
