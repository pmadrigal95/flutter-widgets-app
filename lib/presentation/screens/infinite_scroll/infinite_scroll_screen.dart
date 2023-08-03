import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  bool isloading = false;

  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // scrollController.position.pixels  Posicion actual

      // scrollController.position.maxScrollExtent Posicion max al que puede llegar

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isloading) return;

    isloading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();

    isloading = false;

    //TODO: revisar si esta montado el componente / widget

    if (!isMounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isloading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;

    final lastId = imagesIds.last;

    imagesIds.clear();

    imagesIds.add(lastId + 1);

    addFiveImages();

    isloading = false;

    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),

      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: _ListView(
                scrollController: scrollController, imagesIds: imagesIds)),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isloading
              ? const CircularProgressIndicator()
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/500/300'));
      },
    );
  }
}
