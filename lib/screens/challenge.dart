import 'package:flutter/material.dart';

//yo wala chai stateful mai garney bhaney xito wala method.
//ui ra business logic different thau ma rakhera banako.
class Challenge extends StatelessWidget {
  const Challenge(
      {super.key, this.onAdd, this.onSubtract, required this.valueNotifier});
  final Function? onAdd;
  final Function? onSubtract;
  final ValueNotifier valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (onAdd != null) onAdd!();
                valueNotifier.value++;
              },
              child: const Text("Add"),
            ),
            ElevatedButton(
              onPressed: () {
                if (onSubtract != null) onSubtract!();
                if (valueNotifier.value > 1) valueNotifier.value--;
              },
              child: const Text("Subtract"),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (context, count, child) {
                  return Text("Count: $count");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
