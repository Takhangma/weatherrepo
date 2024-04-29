import 'package:flutter/material.dart';

class SmoothIndicatorCustom extends StatelessWidget {
  SmoothIndicatorCustom({
    super.key,
    required this.pageController,
    required this.count,
    this.activeColor,
    this.inactiveColor,
  });

  final PageController pageController;
  final int count;
  final Color? activeColor;
  final Color? inactiveColor;

  //late int currentIndex = pageController.initialPage;
  //final int currentIndex = 0;

  late final ValueNotifier<int> currentIndex =
      ValueNotifier(pageController.initialPage);

  @override
  Widget build(BuildContext context) {
    print("noooo");
    pageController.addListener(
      () {
        final scrollIndex = pageController.page!.toInt();
        // print(scrollIndex);
        if (scrollIndex != currentIndex.value) {
          print(scrollIndex);
          currentIndex.value = scrollIndex;
        }
      },
    );
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, updatedIndex, child) {
          return Wrap(
            children:
                //Loop wala method
                // for (int i = 0; i < widget.count; i++) indicatorMethod(),

                //Second Method
                List.generate(
              count,
              (index) => indicatorMethod(
                index: index,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                currentIndex: updatedIndex,
              ),
            ),
            //Third Method ?
          );
        });
  }

  Widget indicatorMethod({
    double height = 5,
    double width = 10,
    double radius = 2,
    Color? activeColor,
    Color? inactiveColor,
    required int index,
    required int currentIndex,
  }) {
    return InkWell(
      onTap: () {
        //jun tap garyo tesko index chai naya index hunu paro hola
        // print(index);
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 2),
        height: (index == currentIndex ? 1.1 : 1) * height,
        width: (index == currentIndex ? 1.2 : 1) * width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          //selected xa bhaney activeColor else inactiveColor
          color: index == currentIndex
              ? activeColor ?? Colors.brown
              : inactiveColor ?? Colors.grey,
        ),
      ),
    );
  }
}
