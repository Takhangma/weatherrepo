import 'package:flutter/material.dart';

class MapExample extends StatelessWidget {
  MapExample({super.key});

  final List<({String name, String address, ValueNotifier valueNotifier})>
      record1 = [
    (name: "Takhangma", address: "Bhojpur", valueNotifier: ValueNotifier(0)),
    (name: "Anjana", address: "Hattiban", valueNotifier: ValueNotifier(0))
  ];

  // Map<String, dynamic> myMap = {"Apple": "fruit", "Noodles": "JunkFood"};
  final Map<int, ({int age, String name})> myMap = {
    1: (age: 11, name: "Takhangma"),
    2: (age: 111, name: "ok")
  };

  // myFunction(int age, {List<({String name, String address})> record}) {}

  // Record onlyFunction(int age, {required ({int age, String name}) record}) {
  //   return record;
  // }

  // Map myfunction(Map<int, ({int age, String name})> myMap, {String? name}) =>

  //     myMap?? ;

  @override
  Widget build(BuildContext context) {
    List<String> myList = <String>[];
    myList
      ..add("Name")
      ..add("Another Name");
    print(myList);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   child: Row(
          //     children: [

          //     ],
          //   ),
          // )
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: record.length,
          //     itemBuilder: (BuildContext context, index) => myContainer(
          //         index, context, ValueNotifier(record[index].valueNotifier)),
          //   ),
          // ),

          // ...record.map(
          //   (e) => myContainer(context,
          //       name: e.name,
          //       address: e.address,
          //       valueNotifier: e.valueNotifier),
          // ),

          ...record1.asMap().entries.map(
                (e) => myContainer(context,
                    valueNotifier: e.value.valueNotifier,
                    name: e.value.name,
                    address: e.value.address,
                    index: e.key),
              ),

          // Text(myMap.values.first),
          Text(
              // myMap.keys.toString(),
              // myMap.entries.indexed.first.$1.toString(),
              myMap[1]!.age.toString()),

          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Hi"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("GO"))
                    ],
                  ),
                );
                print('tab');
              },
              child: const Text("Delete")),

          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return TextFormField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          label: Text("Enter"),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }

  Container myContainer(
    BuildContext context, {
    required ValueNotifier valueNotifier,
    required String name,
    required String address,
    required int index,
  }) {
    return Container(
      child: Row(
        children: [
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
          ),
          Text(
            address,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
          ),
          Stack(
            children: [
              ElevatedButton(
                onPressed: () {
                  valueNotifier.value++;
                },
                child: Text("Button"),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (context, count, child) {
                      return Text(count.toString());
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
