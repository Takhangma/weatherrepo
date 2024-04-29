import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/users/application/person_service.dart';
import 'package:food_ui/riverpod/practice/features/users/domain/person_model.dart';
import 'package:food_ui/riverpod/practice/features/users/presentation/person/person_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personListProvider = StateProvider<List<PersonModel>>((ref) {
  return [const PersonModel("Anjana", "Bhojpur", 12)];
});

class PersonList extends ConsumerWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              //list ko length ma changes ayo bhane rebuild hunxa natra hunna
              final count = ref.watch(
                personService.personListNotifierProvider
                    .select((value) => value.length),
              );
              print("List build");
              return ListView.builder(
                itemCount: count,
                itemBuilder: (context, index) {
                  return DataWidget(
                    //person: personData[index],

                    index: index,
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              //ref.read(personListProvider.notifier).state = [];
              // ref.read(personListProvider.notifier).state = [
              //   ...personData,
              //   Person("OK", "OKk")
              // ];

              // ref.read(personListProvider.notifier).update(
              //       (state) => [
              //         ...state,
              //         Person("Utsha", "Kathmandu"),
              //       ],
              //     );

              // ref.read(personListProvider.notifier).update(
              //       (state) => [
              //         ...state
              //           ..add(
              //             Person("Utsha", "Kathmandu"),
              //           ),
              //       ],
              //     );
              ref
                  .read(personService.personListNotifierProvider.notifier)
                  .addPerson(const PersonModel("Utshaaa", "Ilam", 5));
            },
            child: const Text("Add Person"),
          ),
        ],
      ),
    );
  }
}
