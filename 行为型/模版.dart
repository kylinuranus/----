// 抽象类，定义模板方法
abstract class CaffeineBeverage {
  // 模板方法：定义算法骨架
  void prepareRecipe() {
    boilWater();
    brew();
    pourInCup();
    addCondiments();
  }

  // 不可变部分，由抽象类实现
  void boilWater() {
    print('Boiling water...');
  }

  void pourInCup() {
    print('Pouring into cup...');
  }

  // 抽象方法：具体部分由子类实现
  void brew();
  void addCondiments();
}

// 子类实现具体步骤 - 咖啡
class Coffee extends CaffeineBeverage {
  @override
  void brew() {
    print('Dripping coffee through filter...');
  }

  @override
  void addCondiments() {
    print('Adding sugar and milk...');
  }
}

// 子类实现具体步骤 - 茶
class Tea extends CaffeineBeverage {
  @override
  void brew() {
    print('Steeping tea...');
  }

  @override
  void addCondiments() {
    print('Adding lemon...');
  }
}

void main() {
  // 制作咖啡
  CaffeineBeverage coffee = Coffee();
  print('Making coffee:');
  coffee.prepareRecipe();

  // 制作茶
  CaffeineBeverage tea = Tea();
  print('\nMaking tea:');
  tea.prepareRecipe();
}
