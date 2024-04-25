import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfinityScrollScreen extends StatefulWidget {

  // Para utilizar rutas con nombre de go-router
  static const name = 'infinity_screen';

  const InfinityScrollScreen({super.key});

  @override
  State<InfinityScrollScreen> createState() => _InfinityScrollScreenState();
}

class _InfinityScrollScreenState extends State<InfinityScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
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
    if (isLoading) return; // si esta cargando
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    // Evita que durante la carga del los elementos salgas de la pantalla y se rompa
    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted ) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    // Verifica si aun hay elementos por mostrar
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
        scrollController.position.pixels + 120, // Pantalla completa + 120
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('InfiniteScroll'),
      // ),
      backgroundColor: Colors.grey[300],
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, // Quita el espacio reservado del top de la pantalla
        removeBottom: true, // Quita el espacio reservado del bottom de la pantalla
        child: RefreshIndicator(
          onRefresh: () => onRefresh(),
          edgeOffset: 10, // Le da 10 de top del icon para separarlo del dynamic island
          strokeWidth: 2, // hace mas delgado el icon
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                  width: double.infinity,
                  height: 300,
                );
              }),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            // ? SpinPerfect( // Example with animate-do
            //     infinite: true,
            //     child: const Icon(Icons.refresh_rounded),
            //   )
            ? const CircularProgressIndicator()
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
