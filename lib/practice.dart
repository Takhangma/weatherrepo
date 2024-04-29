class Person {
  late String name;
  late String address;

  Person(this.name, this.address);
  Person.named(String name) {
    this.name = "Takhangma";
  }
}

void main() {
  Person newPerson = Person.named("a");
}
