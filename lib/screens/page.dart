import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key, required this.valueNotifier});

  final ValueNotifier valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              valueNotifier.value++;
            },
            child: Text("Add"),
          ),
          ElevatedButton(
            onPressed: () {
              // subtract();
              if (valueNotifier.value > 1) valueNotifier.value--;
            },
            child: Text("Subtract"),
          ),
        ],
      ),
    );
  }
}
