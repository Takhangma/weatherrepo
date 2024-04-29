import 'package:flutter/material.dart';
import 'package:food_ui/screens/cat_home.dart';
import 'package:food_ui/screens/challenge.dart';

class CatUi extends StatefulWidget {
  const CatUi({super.key});

  @override
  State<CatUi> createState() => _CatUiState();
}

class _CatUiState extends State<CatUi> {
  int currentPage = 0;
  List<
      ({
        String navTitle,
        IconData icons,
        ValueNotifier notificationNotifier,
      })> heroRecord = [
    (
      navTitle: "Hero",
      icons: Icons.flash_on,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      navTitle: "Target",
      icons: Icons.track_changes_rounded,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      navTitle: "Challenge",
      icons: Icons.person,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      navTitle: "Calendar",
      icons: Icons.calendar_month_sharp,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      navTitle: "Info",
      icons: Icons.find_in_page,
      notificationNotifier: ValueNotifier(0)
    )
  ];

  // int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //call garnu arko banako class lai
          Expanded(
            child: IndexedStack(
              index: currentPage,
              children: [
                const SecondHomeScreeen(),
                const SecondHomeScreeen(
                  containerColor: Color(0xff644632),
                  levelColor: Colors.white,
                  secondLevelColor: Color(0xff986E4C),
                  catNameColor: Colors.white,
                  catLevelColor: Color(0xff986E4C),
                  sneakerContainer: Color(0xff73533B),
                  newSneakerColor: Color(0xff9F7251),
                  activeColor: Color(0xffE5A96C),
                  inactiveColor: Color(0xff7E5E47),
                  iconBackgroundColor: Color(0xff9F7251),
                  iconColor: Color(0xffDCA065),
                ),
                Challenge(
                  valueNotifier: heroRecord[currentPage].notificationNotifier,
                ),
                Challenge(
                  valueNotifier: heroRecord[currentPage].notificationNotifier,
                ),
                Challenge(
                  valueNotifier: heroRecord[currentPage].notificationNotifier,
                ),
              ],
            ),
          ),
          //BottomNavigation,
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xff6D4935),
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                  ),
            ),
            child: Row(
              //bottomNavigation banako
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...heroRecord
                    .asMap()
                    .entries
                    .map(
                      (e) => bottomNavigationMethod(context,
                          notificationValue: e.value.notificationNotifier,
                          text: e.value.navTitle,
                          icons: e.value.icons,
                          index: e.key),
                    )
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }

//BottomNavigation
  Column bottomNavigationMethod(
    BuildContext context, {
    required String text,
    required IconData icons,
    required int index,
    required ValueNotifier notificationValue,
  }) {
    final isSelected = index == currentPage;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              currentPage = index;
            });
          },
          child: Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                decoration: BoxDecoration(
                    color: isSelected ? Colors.white : const Color(0xff543728),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: isSelected
                        ? [
                            const BoxShadow(
                                color: Color.fromARGB(255, 87, 62, 53),
                                offset: Offset(0, 5),
                                blurRadius: 6,
                                spreadRadius: 6)
                          ]
                        : null),
                child: Icon(
                  icons,
                  size: 28,
                  color: const Color(0xff775B4A),
                ),
              ),
              if (index >= 2)
                Positioned(
                  top: 4,
                  right: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(2),
                    height: 20,
                    width: 27,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDEA066),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: notificationValue,
                      builder: (context, count, child) {
                        return Text(
                          count <= 9 ? "$count " : "9+",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 11),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.white : const Color(0xff9E765D)),
          ),
        ),
      ],
    );
  }
}
