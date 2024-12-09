// 抽象部分
abstract class Logger {
  void log(String message); // 定义抽象的日志行为
}

// 实现部分
class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print("Console: $message");
  }
}

class FileLogger implements Logger {
  @override
  void log(String message) {
    print("File: $message");
  }
}

// 桥接
class App {
  final Logger logger; // 通过组合桥接 Logger 的具体实现

  App(this.logger);

  void run() {
    logger.log("Application started");
  }
}

void main() {
  Logger consoleLogger = ConsoleLogger();
  Logger fileLogger = FileLogger();

  App app = App(consoleLogger);
  app.run(); // Console: Application started

  app = App(fileLogger);
  app.run(); // File: Application started
}
