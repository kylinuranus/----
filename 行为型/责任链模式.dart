// 抽象处理者类
abstract class Handler {
  Handler? nextHandler;

  void setNext(Handler handler) {
    nextHandler = handler;
  }

  void handleRequest(String request);
}

// 具体处理者：检查登录状态
class LoginHandler extends Handler {
  @override
  void handleRequest(String request) {
    if (request == "LOGIN") {
      print("LoginHandler: Handling login request.");
    } else {
      print("LoginHandler: Cannot handle, passing to next handler.");
      nextHandler?.handleRequest(request);
    }
  }
}

// 具体处理者：检查管理员权限
class AdminHandler extends Handler {
  @override
  void handleRequest(String request) {
    if (request == "ADMIN") {
      print("AdminHandler: Handling admin request.");
    } else {
      print("AdminHandler: Cannot handle, passing to next handler.");
      nextHandler?.handleRequest(request);
    }
  }
}

// 具体处理者：默认处理
class DefaultHandler extends Handler {
  @override
  void handleRequest(String request) {
    print(
        "DefaultHandler: No handler for this request. Default action executed.");
  }
}

// 客户端代码
void main() {
  // 创建处理者
  Handler loginHandler = LoginHandler();
  Handler adminHandler = AdminHandler();
  Handler defaultHandler = DefaultHandler();

  // 构建责任链
  loginHandler.setNext(adminHandler);
  adminHandler.setNext(defaultHandler);

  // 发送请求
  print("Request: LOGIN");
  loginHandler.handleRequest("LOGIN");

  print("\nRequest: ADMIN");
  loginHandler.handleRequest("ADMIN");

  print("\nRequest: UNKNOWN");
  loginHandler.handleRequest("UNKNOWN");
}
