import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/users/application/person_service.dart';
import 'package:food_ui/riverpod/practice/features/users/presentation/person/person_home.dart';
import 'package:food_ui/riverpod/practice/features/weather/presentation/weather_home.dart';
import 'package:food_ui/screens/cat_ui.dart';
import 'package:food_ui/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);
    final theme = ref.watch(personService.themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      //theme ko value haru ekthauma raknu ani color
      // haru change garda MaterialApp build huda ni rebuild hunna aru hamile const rakheko xa so .
      theme: theme,

      // home: const CatUi(),
      // // home: SecondDemo(),
      home: const HomeScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
