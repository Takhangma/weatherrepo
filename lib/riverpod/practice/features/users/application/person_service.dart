import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/users/controller/person_list_controller.dart';
import 'package:food_ui/riverpod/practice/features/users/controller/theme_controller.dart';
import 'package:food_ui/riverpod/practice/features/users/domain/person_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personServiceProvider = StateProvider<PersonService>((ref) {
  return PersonService();
});

class PersonService {
  //provider banako
  //controller ko ho yo
  final personListNotifierProvider =
      NotifierProvider<PersonListController, List<PersonModel>>(
//       () {
//   return PersonListNotifier();    LONG CUT
// }

//first parameter le notifier lai ni extend garnu parxa.
//first parameter ma pass gareko lai matra .new garnu milxa.
//SHORT CUT
    PersonListController.new,
  );

//BOOLEAN wala
  final stateProvider = StateProvider<bool>((ref) {
    return false;
  });

//RESTART

  static reset(WidgetRef ref) {
    ref.read(personServiceProvider.notifier).state = PersonService();
  }

// stateprovider
  // final themeProvider = StateProvider<ThemeData>((ref) {
  //   return ThemeData.light();
  // });

  // switchTheme(WidgetRef ref) {
  //   final currentTheme = ref.read(themeProvider);

  //   ref.read(themeProvider.notifier).state =
  //       currentTheme.brightness == Brightness.light
  //           ? ThemeData.dark()
  //           : ThemeData.light();
  // }

  final themeProvider = NotifierProvider<ThemeController, ThemeData>(
    ThemeController.new,
  );
}
