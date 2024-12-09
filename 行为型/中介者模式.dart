// 定义中介者接口
abstract class ChatMediator {
  void sendMessage(String message, User sender);
  void addUser(User user);
}

// 用户类
abstract class User {
  late ChatMediator mediator;
  final String name;

  User(this.name);

  void send(String message);
  void receive(String message);
}

// 具体的中介者实现
class ChatRoom implements ChatMediator {
  final List<User> _users = [];

  @override
  void addUser(User user) {
    _users.add(user);
    user.mediator = this;
  }

  @override
  void sendMessage(String message, User sender) {
    for (var user in _users) {
      if (user != sender) {
        user.receive(message);
      }
    }
  }
}

// 具体的用户类
class ConcreteUser extends User {
  ConcreteUser(String name) : super(name);

  @override
  void send(String message) {
    print("$name: Sending message -> $message");
    mediator.sendMessage(message, this);
  }

  @override
  void receive(String message) {
    print("$name: Received message -> $message");
  }
}

// 客户端代码
void main() {
  // 创建中介者（聊天室）
  ChatMediator chatRoom = ChatRoom();

  // 创建用户
  User user1 = ConcreteUser("Alice");
  User user2 = ConcreteUser("Bob");
  User user3 = ConcreteUser("Charlie");

  // 注册用户到聊天室
  chatRoom.addUser(user1);
  chatRoom.addUser(user2);
  chatRoom.addUser(user3);

  // 用户发送消息
  user1.send("Hi everyone!");
  user2.send("Hello Alice!");
  user3.send("Hey, what's up?");
}