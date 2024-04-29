import 'package:flutter/material.dart';
import 'package:food_ui/screens/page.dart';

class NewPage extends StatefulWidget {
  NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
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
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DummyPage(valueNotifier: heroRecord[0].notificationNotifier),
          ),
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
    );
  }

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
