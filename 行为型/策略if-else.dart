// String handleUserAction(String actionType) {
//   if (actionType == 'login') {
//     return 'User logged in';
//   } else if (actionType == 'logout') {
//     return 'User logged out';
//   } else if (actionType == 'register') {
//     return 'User registered';
//   } else {
//     return 'Unknown action';
//   }
// }

abstract class UserActionStrategy {
  String execute();
}

class LoginAction implements UserActionStrategy {
  @override
  String execute() => 'User logged in';
}

class LogoutAction implements UserActionStrategy {
  @override
  String execute() => 'User logged out';
}

class RegisterAction implements UserActionStrategy {
  @override
  String execute() => 'User registered';
}

class UnknownAction implements UserActionStrategy {
  @override
  String execute() => 'Unknown action';
}

class UserActionContext {
  final Map<String, UserActionStrategy> _actionMap = {
    'login': LoginAction(),
    'logout': LogoutAction(),
    'register': RegisterAction(),
  };

  String handleAction(String actionType) {
    // 根据类型选择对应的策略
    UserActionStrategy? strategy = _actionMap[actionType];
    return (strategy ?? UnknownAction()).execute();
  }
}

void main() {
  UserActionContext context = UserActionContext();

  print(context.handleAction('login')); // 输出：User logged in
  print(context.handleAction('logout')); // 输出：User logged out
  print(context.handleAction('register')); // 输出：User registered
  print(context.handleAction('delete')); // 输出：Unknown action
}
