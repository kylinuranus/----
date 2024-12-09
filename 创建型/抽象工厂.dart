// 抽象产品
abstract class Button {
  void render();
}

abstract class Checkbox {
  void check();
}

// 具体产品
class WindowsButton implements Button {
  @override
  void render() => print("Rendering Windows Button");
}

class MacOSButton implements Button {
  @override
  void render() => print("Rendering MacOS Button");
}

class WindowsCheckbox implements Checkbox {
  @override
  void check() => print("Checking Windows Checkbox");
}

class MacOSCheckbox implements Checkbox {
  @override
  void check() => print("Checking MacOS Checkbox");
}

// 抽象工厂
abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

// 具体工厂
class WindowsFactory implements GUIFactory {
  @override
  Button createButton() => WindowsButton();
  @override
  Checkbox createCheckbox() => WindowsCheckbox();
}

class MacOSFactory implements GUIFactory {
  @override
  Button createButton() => MacOSButton();
  @override
  Checkbox createCheckbox() => MacOSCheckbox();
}

void main() {
  GUIFactory factory = WindowsFactory();
  Button button = factory.createButton();
  Checkbox checkbox = factory.createCheckbox();

  button.render(); // 输出: Rendering Windows Button
  checkbox.check(); // 输出: Checking Windows Checkbox
}
