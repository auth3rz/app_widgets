import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
} 

final slides = <SlideInfo>[
  SlideInfo(
    'Buscar Comida', 
    'Consectetur laborum eu laboris do tempor commodo laboris ad consectetur occaecat. Dolore commodo cupidatat non pariatur sit laboris eiusmod consectetur aliqua aliquip. Minim minim dolor incididunt adipisicing qui occaecat dolore ut fugiat ullamco incididunt eiusmod non. Sunt elit minim irure aute consectetur Lorem adipisicing.', 
    'assets/images/1.png'
  ),
  SlideInfo(
    'Entrega rápida', 
    'Exercitation elit ex deserunt Lorem ad. Id ea laboris ut reprehenderit nulla ex. Nostrud amet eu laboris exercitation minim commodo excepteur. Amet Lorem fugiat nulla eu et culpa ea ea. Nulla cupidatat enim quis qui fugiat proident do consectetur mollit. Velit quis ex ipsum veniam aliquip deserunt.', 
    'assets/images/2.png'
  ),
  SlideInfo(
    'Disfruta la comida', 
    'Proident Lorem esse quis nostrud. Incididunt nisi id occaecat adipisicing incididunt veniam voluptate esse nisi consequat elit. Consectetur culpa culpa id ut id. Exercitation mollit sit commodo aliquip quis culpa commodo sit veniam et minim. Nisi labore ipsum Lorem quis sunt minim mollit ea laborum excepteur. Duis esse magna voluptate duis Lorem.', 
    'assets/images/3.png'
  ),
];



class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}


class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageviewController = PageController();
  var endReached = false;
  @override
  void initState() {
    super.initState();
    pageviewController.addListener((){
      final page = pageviewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() => endReached = true);
      }
    });
  }
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title    : slideData.title, 
                caption  : slideData.caption, 
                imageUrl : slideData.imageUrl
              )).toList(),
          ),
          endReached ? Container() :
          Positioned(
            bottom: 50,
            left: 20,
            child: TextButton(
              onPressed: () => setState(() => pageviewController.jumpToPage(slides.length-1)) ,
              child: const Text('Saltar'),
            ),
          ),
          !endReached ? Container() :
          Positioned(
            bottom: 50,
            right: 20,
            child: FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });


  @override
  Widget build(BuildContext context) {
    final theStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(
              title,
              style: theStyle.titleLarge,
            ),
            const SizedBox(height: 10,),
            Text(
              caption,
              style: theStyle.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}