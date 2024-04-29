import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/users/application/person_service.dart';
import 'package:food_ui/riverpod/practice/features/users/presentation/person/person_list.dart';
import 'package:food_ui/riverpod/practice/features/users/presentation/welcome.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondDemo extends ConsumerWidget {
  const SecondDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);
    final value = ref.watch(personService.stateProvider);

    //print(value);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //PersonServiceko naya instance banayepaxi sab reset bhayo. rebuild
              // ref.read(personServiceProvider.notifier).state = PersonService();
              PersonService.reset(ref);
            },
            icon: const Icon(Icons.restart_alt),
          ),
          IconButton(
            onPressed: () {
              // ref.read(personService.themeProvider.notifier).update(
              //   (state) {
              //     return state.brightness == Brightness.dark
              //         ? ThemeData.light()
              //         : ThemeData.dark();
              //   },
              // );
              // personService.switchTheme(ref)
              ref.read(personService.themeProvider.notifier).switchTheme();
              //ref.read(personService.themeProvider.notifier).isDarkMode;
            },
            icon: Consumer(builder: (context, ref, child) {
              final mode = ref.watch(personService.themeProvider);

              return Icon(
                  ref.read(personService.themeProvider.notifier).isDarkMode
                      ? Icons.dark_mode
                      : Icons.sunny);
            }),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //mathi ko value  yesma auxa
          value ? const PersonList() : const WelcomeWidget(),
          Switch(
              value: value,
              onChanged: (newValue) {
                ref.read(personService.stateProvider.notifier).state = newValue;
              })
        ],
      ),
    );
  }
}
