import 'package:hooks_riverpod/hooks_riverpod.dart';

final myClassProvider = Provider<PersonModel>((ref) {
  return const PersonModel("Takhangma", "Lalitpur", 11);
});

//yesma value matra basyo state nikaldeko.
//hamile riverpod use gareko xa ani immutable lai ni
//watch garer select garea ekek ota ko state change garnu milo controller bhitra . YESMA HAINA
//immutable = kei sanga link bhayena value matra hold garxa
class PersonModel {
  final String name;
  final String address;

  //YESERE NA RAKHNU PROVIDER MODEL MA!!!!!!!!
  // final StateProvider ageStateProvider = StateProvider<int>((ref) {
  //   return 1;
  // });
  final int age;

  const PersonModel(this.name, this.address, this.age);

  PersonModel copyWith({String? name, String? address, int? age}) =>
      PersonModel(name ?? this.name, address ?? this.address, age ?? this.age);

  // newfunction() {
  //   PersonModel person = PersonModel("aa", "cc", 1);
  //   final newPerson =  person.copyWith(name: "takhangma");
  // }
}
