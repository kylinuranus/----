/// 上下文类，用于存储变量的值
class Context {
  final Map<String, int> variables = {};

  void assign(String variable, int value) {
    variables[variable] = value;
  }

  int? getValue(String variable) {
    return variables[variable];
  }
}

/// 抽象表达式
abstract class Expression {
  int interpret(Context context);
}

/// 变量表达式（终结符表达式）
class VariableExpression extends Expression {
  final String name;

  VariableExpression(this.name);

  @override
  int interpret(Context context) {
    final value = context.getValue(name);
    if (value == null) {
      throw Exception('Undefined variable: $name');
    }
    return value;
  }
}

/// 常量表达式（终结符表达式）
class ConstantExpression extends Expression {
  final int value;

  ConstantExpression(this.value);

  @override
  int interpret(Context context) {
    return value;
  }
}

/// 加法表达式（非终结符表达式）
class AddExpression extends Expression {
  final Expression left;
  final Expression right;

  AddExpression(this.left, this.right);

  @override
  int interpret(Context context) {
    return left.interpret(context) + right.interpret(context);
  }
}

/// 减法表达式（非终结符表达式）
class SubtractExpression extends Expression {
  final Expression left;
  final Expression right;

  SubtractExpression(this.left, this.right);

  @override
  int interpret(Context context) {
    return left.interpret(context) - right.interpret(context);
  }
}

/// 客户端代码
void main() {
  // 创建上下文并设置变量值
  final context = Context();
  context.assign('x', 10);
  context.assign('y', 5);

  // 创建表达式 x + (y - 3)
  final expression = AddExpression(
    VariableExpression('x'),
    SubtractExpression(
      VariableExpression('y'),
      ConstantExpression(3),
    ),
  );

  // 解释表达式并输出结果
  final result = expression.interpret(context);
  print('Result: $result'); // 输出: Result: 12
}
