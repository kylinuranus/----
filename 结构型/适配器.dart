// 目标接口
abstract class Target {
  void request();
}

// 已有类
class Adaptee {
  void specificRequest() {
    print("Specific request called");
  }
}

// 适配器类
class Adapter implements Target {
  final Adaptee adaptee;

  Adapter(this.adaptee);

  @override
  void request() {
    adaptee.specificRequest();
  }
}

void main() {
  Adaptee adaptee = Adaptee();
  Target adapter = Adapter(adaptee);

  adapter.request(); // 输出: Specific request called
}
