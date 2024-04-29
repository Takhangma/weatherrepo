import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_ui/widgets/smooth_page_indicator.dart';

class SecondHomeScreeen extends StatefulWidget {
  const SecondHomeScreeen({
    super.key,
    this.levelColor,
    this.secondLevelColor,
    this.catNameColor,
    this.catLevelColor,
    this.containerColor,
    this.sneakerContainer,
    this.newSneakerColor,
    this.activeColor,
    this.inactiveColor,
    this.iconBackgroundColor,
    this.iconColor,
    this.items,
  });
  final Color? containerColor;
  final Color? levelColor;
  final Color? secondLevelColor;
  final Color? catNameColor;
  final Color? catLevelColor;
  final Color? sneakerContainer;
  final Color? newSneakerColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final List<
      ({
        String name,
        String image,
        String firstImage,
        String secondImage,
        IconData icon,
        IconData secondIcon,
      })>? items;

  @override
  State<SecondHomeScreeen> createState() => _SecondHomeScreeenState();
}

class _SecondHomeScreeenState extends State<SecondHomeScreeen> {
  //for smooth indicator
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.items == null || widget.items!.isEmpty) {
      record = [
        (
          name: "Cat Simon",
          image: "asset/images/catt.png",
          icon: Icons.add,
          secondIcon: Icons.ac_unit_rounded,
          firstImage: "asset/images/cattwo.png",
          secondImage: "asset/images/catone.png",
        ),
        (
          name: "Mr Simon",
          image: "asset/images/catt.png",
          icon: Icons.snapchat,
          secondIcon: Icons.adb_outlined,
          firstImage: "asset/images/catfour.png",
          secondImage: "asset/images/catthree.png"
        ),
        (
          name: "Mrs Simon",
          image: "asset/images/catt.png",
          icon: Icons.cabin_outlined,
          secondIcon: Icons.girl_rounded,
          firstImage: "asset/images/dogtwo.png",
          secondImage: "asset/images/dogone.png"
        ),
        (
          name: "Sad Simon",
          image: "asset/images/catt.png",
          icon: Icons.flaky,
          secondIcon: Icons.other_houses_sharp,
          firstImage: "asset/images/dog.png",
          secondImage: "asset/images/cow.png"
        ),
      ];
    }
  }

  late List<
      ({
        String name,
        String image,
        String firstImage,
        String secondImage,
        IconData icon,
        IconData secondIcon,
      })> record;

  int currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double randomAngle = Random().nextDouble() * 360;
    return Scaffold(
      backgroundColor: const Color(0xff6D4935),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                //cat wala container
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.containerColor ?? const Color(0xffE6D6C7),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "LEVEL ${currentIndex + 1}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: widget.levelColor ??
                                                      const Color(0xff926F5F),
                                                ),
                                          ),
                                          Text(
                                            "${currentIndex + 1} of ${record.length}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: widget
                                                          .secondLevelColor ??
                                                      const Color(0xffBAA090),
                                                ),
                                          ),
                                        ],
                                      ),

                                      //smoothPageIndicator
                                      //bakixa pageview halera slide garnu
                                      // Container(
                                      //   margin: const EdgeInsets.only(top: 7),
                                      //   child: SmoothPageIndicator(
                                      //     onDotClicked: (index) {
                                      //       _pageController.animateToPage(index,
                                      //           duration:
                                      //               const Duration(milliseconds: 200),
                                      //           curve: Curves.easeIn);
                                      //     },
                                      //     controller: _pageController,
                                      //     count: record.length,
                                      //     effect: const SlideEffect(
                                      //         activeDotColor: Colors.brown,
                                      //         spacing: 5,
                                      //         dotWidth: 15,
                                      //         dotHeight: 8),
                                      //   ),
                                      // ),

                                      // CUSTOM INDICATOR
                                      //stateful
                                      CustomPageIndicator(
                                        pageController: _pageController,
                                        count: record.length,
                                        activeColor: widget.activeColor,
                                        inactiveColor: widget.inactiveColor,
                                        pageScrollDuration:
                                            const Duration(milliseconds: 1000),
                                      ),

                                      //stateless
                                      // SmoothIndicatorCustom(
                                      //   pageController: _pageController,
                                      //   count: record.length,
                                      // )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff8C6650),
                                      ),
                                      child: const RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          Icons.tune,
                                          color: Color(0xffC7A081),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          //pageview
                          child: Stack(
                            children: [
                              PageView.builder(
                                onPageChanged: (value) {
                                  setState(() {
                                    currentIndex = value;
                                  });
                                },
                                controller: _pageController,
                                itemCount: record.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Text(
                                        record[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                color: widget.catNameColor ??
                                                    const Color(0xff926F5F)),
                                      ),
                                      Text(
                                        "Level ${currentIndex + 1}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                color: widget.catLevelColor ??
                                                    const Color(0xffBFA69B),
                                                fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // padding: const EdgeInsets.all(5),
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  record[index].image),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              // using map
                              // PageView(
                              //   onPageChanged: (value) {
                              //     setState(() {
                              //       currentIndex = value;
                              //     });
                              //   },
                              //   controller: _pageController,
                              //   children: record
                              //       .map(
                              //         (e) => Column(
                              //           children: [
                              //             Text(
                              //               e.name,
                              //               style: Theme.of(context)
                              //                   .textTheme
                              //                   .headlineMedium
                              //                   ?.copyWith(
                              //                       color: const Color(0xff926F5F)),
                              //             ),
                              //             Text(
                              //               "Level 2",
                              //               style: Theme.of(context)
                              //                   .textTheme
                              //                   .titleLarge
                              //                   ?.copyWith(
                              //                       color: const Color(0xffBFA69B),
                              //                       fontWeight: FontWeight.w500),
                              //             ),
                              //             Expanded(
                              //               child: Container(
                              //                 // padding: const EdgeInsets.all(5),
                              //                 margin: const EdgeInsets.only(top: 50),
                              //                 decoration: BoxDecoration(
                              //                   image: DecorationImage(
                              //                     image: AssetImage(e.image),
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       )
                              //       .toList(),
                              // ),

                              ...[
                                stackImageMethod(
                                    imageOrIcon:
                                        record[currentIndex].firstImage,
                                    leftValue: 5,
                                    topValue: 90,
                                    height: 68,
                                    width: 70,
                                    angle: randomAngle),
                                stackImageMethod(
                                    imageOrIcon:
                                        record[currentIndex].secondImage,
                                    topValue: 180,
                                    leftValue: 10,
                                    height: 50,
                                    width: 50,
                                    angle: randomAngle),
                                stackImageMethod(
                                    imageOrIcon: record[currentIndex].icon,
                                    height: 48,
                                    width: 50,
                                    topValue: 90,
                                    rightValue: 10,
                                    angle: randomAngle),
                                stackImageMethod(
                                    imageOrIcon:
                                        record[currentIndex].secondIcon,
                                    height: 55,
                                    width: 55,
                                    topValue: 150,
                                    rightValue: 5,
                                    angle: randomAngle),
                              ].reversed.toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //sneaker wala
                Container(
                  decoration: BoxDecoration(
                      color: widget.sneakerContainer ?? const Color(0xffC2A78D),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: const [
                        BoxShadow(
                            // color: Color.fromARGB(255, 106, 87, 79),
                            // offset: Offset(0, 10),
                            // blurRadius: 30,
                            // spreadRadius: 0.8,
                            )
                      ]),
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 90,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 30),
                    decoration: BoxDecoration(
                        color:
                            widget.newSneakerColor ?? const Color(0xff86644F),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                        shape: BoxShape.rectangle),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.ice_skating_outlined,
                          color: Color(0xffDEA066),
                        ),
                        Text(
                          "New Sneakers",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Stack wala
  Widget stackImageMethod({
    required dynamic imageOrIcon,
    double? topValue,
    double? bottomValue,
    double? leftValue,
    double? rightValue,
    double? width,
    double? height,
    required double angle,
  }) {
    return Positioned(
      top: topValue,
      bottom: bottomValue,
      left: leftValue,
      right: rightValue,
      height: height,
      width: width,
      child: Transform.rotate(
        angle: angle * 3.14 / 180,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 166, 143, 137),
                  offset: Offset(5, 5),
                  blurRadius: 25,
                  spreadRadius: 0.5),
            ],
            borderRadius: BorderRadius.circular(3),
            color: imageOrIcon is String
                ? Colors.white
                : widget.iconBackgroundColor ?? const Color(0xffF1DFD0),
            image: imageOrIcon is String
                ? DecorationImage(
                    image: AssetImage(imageOrIcon),
                  )
                : null,
          ),
          child: imageOrIcon is IconData
              ? Icon(
                  imageOrIcon,
                  size: 30,
                  color: widget.iconColor ?? const Color(0xff8A654F),
                )
              : null,
        ),
      ),
    );
  }
}
