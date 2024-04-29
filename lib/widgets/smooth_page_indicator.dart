import 'package:flutter/material.dart';

class CustomPageIndicator extends StatefulWidget {
  const CustomPageIndicator({
    super.key,
    required this.pageController,
    required this.count,
    this.activeColor,
    this.inactiveColor,
    this.pageScrollDuration,
  });
  final PageController pageController;
  final int count;
  final Color? activeColor;
  final Color? inactiveColor;
  final Duration? pageScrollDuration;
  // int currentIndex;

  @override
  State<CustomPageIndicator> createState() => _CustomPageIndicatorState();
}

class _CustomPageIndicatorState extends State<CustomPageIndicator> {
  late int currentIndex = widget.pageController.initialPage;
  //int currentIndex = 0;
  // late int indexMultiplier = currentIndex * 5;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.pageController.initialPage;

    widget.pageController.addListener(() {
      final scrollIndex = widget.pageController.page!.toInt();
      // print("Scroll index is $scrollIndex");
      if (scrollIndex != currentIndex) {
        // print("if bhitra ko scroll index is $scrollIndex");
        // print("if bhitrako current index is $currentIndex");
        setState(() {
          currentIndex = scrollIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:
          //Loop wala method
          // for (int i = 0; i < widget.count; i++) indicatorMethod(),

          //Second Method
          List.generate(
        widget.count,
        (index) => indicatorMethod(
          index: index,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          duration: widget.pageScrollDuration,
        ),
      ),
      //Third Method ?
    );
  }

  Widget indicatorMethod({
    double height = 5,
    double width = 10,
    double radius = 2,
    Color? activeColor,
    Color? inactiveColor,
    required int index,
    required Duration? duration,
  }) {
    return InkWell(
      onTap: () {
        //jun tap garyo tesko index chai naya index hunu paro hola
        // print(index);
        widget.pageController.animateToPage(index,
            duration: duration ?? const Duration(milliseconds: 300),
            curve: Curves.easeIn);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
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
