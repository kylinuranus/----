// 组件接口
abstract class Component {
  void operation();
}

// 叶子节点
class Leaf implements Component {
  final String name;

  Leaf(this.name);

  @override
  void operation() {
    print("Leaf: $name");
  }
}

// 容器节点
class Composite implements Component {
  final List<Component> _children = [];

  void add(Component component) {
    _children.add(component);
  }

  @override
  void operation() {
    print("Composite node:");
    for (Component child in _children) {
      child.operation();
    }
  }
}

void main() {
  Leaf leaf1 = Leaf("Leaf 1");
  Leaf leaf2 = Leaf("Leaf 2");

  Composite composite = Composite();
  composite.add(leaf1);
  composite.add(leaf2);

  composite.operation();
  // 输出:
  // Composite node:
  // Leaf: Leaf 1
  // Leaf: Leaf 2
}
