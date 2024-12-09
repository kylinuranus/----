// 抽象策略接口
abstract class PaymentStrategy {
  void pay(double amount);
}

// 具体策略：信用卡支付
class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;
  final String cardHolder;

  CreditCardPayment(this.cardNumber, this.cardHolder);

  @override
  void pay(double amount) {
    print('Paid $amount using Credit Card: $cardHolder ($cardNumber)');
  }
}

// 具体策略：PayPal支付
class PayPalPayment implements PaymentStrategy {
  final String email;

  PayPalPayment(this.email);

  @override
  void pay(double amount) {
    print('Paid $amount using PayPal: $email');
  }
}

// 具体策略：现金支付
class CashPayment implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('Paid $amount in cash.');
  }
}

// 上下文类：负责使用策略
class PaymentContext {
  PaymentStrategy? _strategy;

  // 设置策略
  void setStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  // 执行支付
  void executePayment(double amount) {
    if (_strategy == null) {
      print('No payment strategy selected!');
    } else {
      _strategy!.pay(amount);
    }
  }
}

void main() {
  // 上下文
  PaymentContext paymentContext = PaymentContext();

  // 使用信用卡支付
  paymentContext.setStrategy(CreditCardPayment('1234-5678-9012', 'John Doe'));
  paymentContext.executePayment(100.0);

  // 切换为PayPal支付
  paymentContext.setStrategy(PayPalPayment('john.doe@example.com'));
  paymentContext.executePayment(200.0);

  // 切换为现金支付
  paymentContext.setStrategy(CashPayment());
  paymentContext.executePayment(50.0);
}
