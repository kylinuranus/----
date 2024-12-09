class SubsystemA {
  void operationA() => print("Subsystem A operation");
}

class SubsystemB {
  void operationB() => print("Subsystem B operation");
}

class Facade {
  final SubsystemA subsystemA;
  final SubsystemB subsystemB;

  Facade(this.subsystemA, this.subsystemB);

  void operation() {
    subsystemA.operationA();
    subsystemB.operationB();
  }
}

void main() {
  Facade facade = Facade(SubsystemA(), SubsystemB());
  facade.operation();
  // 输出:
  // Subsystem A operation
  // Subsystem B operation
}
