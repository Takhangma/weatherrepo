import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = StateProvider<int>((ref) {
  return 0;
});

class RiverpodDemo extends ConsumerWidget {
  const RiverpodDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final value = ref.watch(numberProvider);
    print("Rebuild");
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Riverpod"),
            const TextWidget(),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state++;
              },
              child: const Text("Add"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state--;
              },
              child: const Text("Subtract"),
            ),
            Consumer(builder: (context, ref, child) {
              return Text(
                ref.watch(numberProvider).toString(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Text(ref.watch(numberProvider).toString());
    });
  }
}
