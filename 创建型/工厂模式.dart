// 产品接口
abstract class Product {
  void operation();
}

// 产品实现
class ProductA implements Product {
  @override
  void operation() => print("Product A created");
}

class ProductB implements Product {
  @override
  void operation() => print("Product B created");
}

// 工厂类
class ProductFactory {
  static Product createProduct(String type) {
    if (type == 'A') return ProductA();
    if (type == 'B') return ProductB();
    throw 'Unknown product type';
  }
}

void main() {
  Product productA = ProductFactory.createProduct('A');
  productA.operation(); // 输出: Product A created

  Product productB = ProductFactory.createProduct('B');
  productB.operation(); // 输出: Product B created
}
