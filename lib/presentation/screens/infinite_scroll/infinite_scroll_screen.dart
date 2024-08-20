import 'package:animate_do/animate_do.dart';
import 'package:app_widgets/config/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final controller = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void agregaCincoMas () {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    agregaCincoMas();
    isLoading = false;
    setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    agregaCincoMas();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (controller.position.pixels + 150 <= controller.position.maxScrollExtent) return;
    controller.animateTo(
      controller.position.pixels +120, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void initState() {
    super.initState();
    controller.addListener((){
      if ((controller.position.pixels + 500) >= controller.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: sh(0.01, context),
          strokeWidth: 2,
          child: ListView.builder(
            controller: controller,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/jar-loading.gif');
                },
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        child:
        isLoading ? 
        SpinPerfect(
          infinite: true,
          child: Icon(
            Icons.refresh,
            color: Theme.of(context).colorScheme.surface,
          ),
        ) :
         Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}