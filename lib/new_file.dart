({int age, String name, List<String> list}) myRecord = (
  age: 10,
  name: "Takhangma",
  list: ["Takhangma"],
);

Map<int, ({int age, String name})> myMap = {1: (age: 111, name: "Anjana")};

final List<String> myList = ["aa", "bb"];

// void main() {
//   //clear garnu immutable list
//   myList.clear();
//   // print(myList);
//   //immutable ma nayalist assign garnu addall
//   myList.addAll([]);
// }

//function

({int age, String name}) myFunction(int numb,
    {required ({int age, String name}) myRecord}) {
  return (age: numb, name: myRecord.name);
}

//return type map, parameter tyae map same, map optional named paramter,
// arrow function use garera tyo paramter null xa bhaney empty map natra tyae map.
Map<int, ({int age, String name})> newFunction(
        {Map<int, ({int age, String name})>? myMap}) =>
    myMap ?? {};

//void function no return type. default postitonal perameter int wala, perint int
void onlyFunction([int age = 111]) {
  print(age);

  dynamic variable;

  print(variable is! int);

  int a = 10;
  int b = 5;
  int c = a % b;
  print(c);

  String? name;
  String test = name ?? "Yayyy";

  Map<int, String> mapp = {1: "name"};
  // mapp.entries.first.value..contains("other");
  Map<int, String> newMap = {...mapp};

  List<String> newList = ["dsaf"];
  List<String> myList = List.of(
      newList); //spread gareko jasto nayalist assign bhayo eutae refrence hudaina.
  //myList.addAll(newList);
}

//default constructor
class MyClass {
  final int age;
  final String name;
  final String surname;
  const MyClass({required this.age, required this.name, required this.surname});
}

//operator

//class, widgets, layout sab





