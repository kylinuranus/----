// 实现部分
abstract class Color {
  String fill(); // 定义实现的接口
}

class Red implements Color {
  @override
  String fill() => "Red";
}

class Blue implements Color {
  @override
  String fill() => "Blue";
}

// 抽象部分
abstract class Shape {
  final Color color; // 通过组合实现桥接

  Shape(this.color);

  String draw(); // 抽象定义的行为
}

class Circle extends Shape {
  Circle(Color color) : super(color);

  @override
  String draw() => "Circle filled with ${color.fill()}";
}

void main() {
  Shape redCircle = Circle(Red());
  Shape blueCircle = Circle(Blue());

  print(redCircle.draw()); // Circle filled with Red
  print(blueCircle.draw()); // Circle filled with Blue
}
