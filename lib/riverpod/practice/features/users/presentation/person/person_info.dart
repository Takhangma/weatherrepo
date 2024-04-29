import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/users/application/person_service.dart';
import 'package:food_ui/riverpod/practice/features/users/domain/person_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, this.person, this.index});
  final PersonModel? person;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer(
        builder: (context, ref, child) {
          // person ma value xa bhaney tyesko data natra suruma provider ma bhako data

          // print("rebuild");
          final personService = ref.watch(personServiceProvider);
          final myClass = person ??
              ref.read(
                //yo read chai hamro address change hunna tyae bhyera gareko
                //select chai filter garnalai use gareko.
                //providerma matra launu milxa
                personService.personListNotifierProvider.select(
                  //condition null ma gayepaxi listener lai dispose gardinxa
                  (value) => value.length > index! ? value[index!] : null,
                ),
              );
          print("$index build");

          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final name = ref.watch(personService
                        .personListNotifierProvider
                        .select((value) =>
                            value.length > index! ? value[index!].name : null));
                    print("$index name print");
                    return GestureDetector(
                        onTap: () {
                          ref
                              .read(personService
                                  .personListNotifierProvider.notifier)
                              .updatePerson(index!, name: "Updated");
                        },
                        child: Text("Name: $name"));
                  },
                ),
                Text("Address: ${myClass!.address}"),
                Consumer(
                  builder: (context, ref, child) {
                    // final intValue = ref.watch(myClass.age);
                    final intValue = myClass.age;
                    if (intValue == 0) {
                      //build method ma bhako bhayera kureko.
                      // Future.delayed(const Duration(milliseconds: 10), () {
                      //   ref.read(stateProvider.notifier).state = false;
                      // });
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              // ref
                              //     .read(myClass.ageStateProvider.notifier)
                              //     .state--;

                              // //yo ni thik xa.
                              // if (ref.read(myClass.ageStateProvider) == 0) {
                              //   ref
                              //       .read(personService.stateProvider.notifier)
                              //       .state = false;
                              // }

                              ref
                                  .read(personService
                                      .personListNotifierProvider.notifier)
                                  .subtractAge(index!);
                            },
                            icon: const Icon(Icons.remove)),
                        Consumer(builder: (context, ref, child) {
                          final ageValue = ref.watch(personService
                              .personListNotifierProvider
                              .select((value) => value.length > index!
                                  ? value[index!].age
                                  : null));
                          print("$index agee");
                          return Text("Age: $ageValue",
                              style: Theme.of(context).textTheme.bodySmall);
                        }),
                        IconButton(
                          onPressed: () {
                            // ref.read(myClass.ageStateProvider.notifier).state++;
                            ref
                                .read(personService
                                    .personListNotifierProvider.notifier)
                                .addAge(index!);
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    if (index != null) {
                      // ref
                      //     .read(personListProvider.notifier)
                      //     .state
                      //     .removeAt(index!);

                      // ref
                      //     .read(personListProvider.notifier)
                      //     .update(
                      //       (state) => [...state],
                      //     )
                      //     .removeAt(index!);
                      //remove bhyaesi update
                      //speradoperator = suruma bhako state lai nikalera spread garera naya wala list banako ani update garda notify bhako?

                      //cascade operator
                      // ref.read(personListProvider.notifier).update(
                      //       (state) => [...state..removeAt(index!)],
                      //     );

                      // final userList =
                      //     ref.read(personListProvider.notifier).state;
                      // ref.read(personListProvider.notifier).state = [
                      //   ...userList..removeAt(index!)
                      // ];

                      //Using stateNotifierProvider
                      ref
                          .read(
                              personService.personListNotifierProvider.notifier)
                          .removePerson(index!);
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
