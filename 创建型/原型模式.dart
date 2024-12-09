// 原型接口
abstract class Prototype {
  Prototype clone();
}

// 具体原型
class Person implements Prototype {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  Prototype clone() {
    return Person(name, age);
  }

  @override
  String toString() => "Name: $name, Age: $age";
}

void main() {
  Person original = Person("John", 30);
  Person clone = original.clone() as Person;

  print(original); // 输出: Name: John, Age: 30
  print(clone); // 输出: Name: John, Age: 30
}
