import 'package:food_ui/riverpod/practice/features/users/domain/person_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:food_ui/riverpod/practice/features/users/application/person_service.dart';

//NOTIFIER PROVIDER
//NOTIFIER WALA ------types:- NotifierProvider, AsyncNotifierProvider
//aync data type use garney bhaye chai AsyncNotifierProvider normal data type cha bhane chai NotifierProvider
//async ra await garnu pauxa
//ref bhanne parameter bananupardaina. inbuild/provider bhitra hunxa
//yesma ref use garnu pauxa consumer le wrap garera  ref pass garnu parena
//provider ko subclass banako

class PersonListController extends Notifier<List<PersonModel>> {
  @override
  build() {
    ref.read(personServiceProvider).stateProvider;
    return [];
  }

  addPerson(PersonModel person) {
    //state = [...state, person];
    state = [...state..add(person)];
    // ref.read(stateProvider.notifier).state = false;
  }

  removePerson(int index) {
    state = [...state..removeAt(index)];
  }

  updatePerson(int index, {int? age, String? address, String? name}) {
    //state[index] = state[index].copyWith(age: age);

    state = [
      //update garney primary method
      ...state
        ..[index] =
            state[index].copyWith(age: age, address: address, name: name),
    ];

    // final newInstance = state[index].copyWith(age: age);
    // state[index] = newInstance;
    // state = [...state];
    // state = [...state..[index] = newInstance];
  }

  addAge(int index) {
    updatePerson(index, age: state[index].age + 1);
  }

  subtractAge(int index) {
    if (state[index].age > 0) {
      updatePerson(index, age: state[index].age - 1);
    }
  }
}



// STATENOTIFIER PROVIDER
// async ra await garnu mildaina
// first parameter chai statenotifier nai hunuparxa
// second dataType.
// yesma ref use garnu consumer le wrap garera ref pass garnu parxa

// final newProvider = StateNotifierProvider<IntController, int>((ref) {
//   return IntController();
// });

// class IntController extends StateNotifier<int> {
//   IntController() : super(1);
// suruma state banauda mildaina. i.e super ma.
// class banayepaxi chai use garnu milxa.
//   newFunction() async {
//     await Future.delayed(Duration(milliseconds: 100));
//   }
// }

// final personStateListNotifierProvider =
//     StateNotifierPrController, List<PersonModel>>((ref) {
//   return PersonListNotifier();
// });

// class PersonListNotifier extends StateNotifier<List<PersonModel>> {
//   PersonListNotifier() : super([]);
//   addPerson(PersonModel person) {
//     //state = [...state, person];
//     state = [...state..add(person)];

//   }

//   removePerson(int index) {
//     state = [...state..removeAt(index)];
//   }
// }




