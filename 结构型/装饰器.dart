// 基础组件
abstract class Component {
  String operation();
}

// 具体组件
class ConcreteComponent implements Component {
  @override
  String operation() => "Base Component";
}

// 装饰器基类
abstract class Decorator implements Component {
  final Component component;

  Decorator(this.component);

  @override
  String operation() => component.operation();
}

// 具体装饰器
class ConcreteDecoratorA extends Decorator {
  ConcreteDecoratorA(Component component) : super(component);

  @override
  String operation() => "${super.operation()} + Decorator A";
}

void main() {
  Component component = ConcreteComponent();
  Component decorated = ConcreteDecoratorA(component);

  print(decorated.operation()); // 输出: Base Component + Decorator A
}
