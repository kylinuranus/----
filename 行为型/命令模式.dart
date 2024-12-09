// 定义命令接口
abstract class Command {
  void execute(); // 执行命令
  void undo(); // 撤销命令
}

// 接收者：智能家居设备
class Light {
  void turnOn() => print("Light is ON");
  void turnOff() => print("Light is OFF");
}

// 具体命令：打开灯
class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() => light.turnOn();

  @override
  void undo() => light.turnOff();
}

// 具体命令：关闭灯
class LightOffCommand implements Command {
  final Light light;

  LightOffCommand(this.light);

  @override
  void execute() => light.turnOff();

  @override
  void undo() => light.turnOn();
}

// 调用者：遥控器
class RemoteControl {
  final Map<String, Command> _commands = {};
  final List<Command> _history = [];

  void setCommand(String button, Command command) {
    _commands[button] = command;
  }

  void pressButton(String button) {
    final command = _commands[button];
    if (command != null) {
      command.execute();
      _history.add(command);
    } else {
      print("No command assigned to $button");
    }
  }

  void pressUndo() {
    if (_history.isNotEmpty) {
      final lastCommand = _history.removeLast();
      lastCommand.undo();
    } else {
      print("No command to undo");
    }
  }
}

// 客户端代码
void main() {
  // 创建接收者
  final light = Light();

  // 创建具体命令
  final lightOn = LightOnCommand(light);
  final lightOff = LightOffCommand(light);

  // 创建调用者
  final remote = RemoteControl();

  // 设置命令到遥控器的按钮
  remote.setCommand("A", lightOn);
  remote.setCommand("B", lightOff);

  // 模拟按钮操作
  print("Pressing button A:");
  remote.pressButton("A"); // 打开灯

  print("\nPressing button B:");
  remote.pressButton("B"); // 关闭灯

  print("\nPressing undo:");
  remote.pressUndo(); // 撤销关闭灯的操作
}

// 多命令组合
// // 宏命令实现
// class MacroCommand implements Command {
//   final List<Command> _commands;

//   MacroCommand(this._commands);

//   @override
//   void execute() {
//     for (var command in _commands) {
//       command.execute();
//     }
//   }

//   @override
//   void undo() {
//     for (var command in _commands.reversed) {
//       command.undo();
//     }
//   }
// }

// // 示例：组合多个命令
// void main() {
//   final light = Light();
//   final lightOn = LightOnCommand(light);
//   final lightOff = LightOffCommand(light);

//   final macro = MacroCommand([lightOn, lightOff]);
//   macro.execute();
//   macro.undo();
// }
