abstract class ElevatorState {
  void openDoor();
  void closeDoor();
  void move();
}

class RunningState implements ElevatorState {
  @override
  void openDoor() {
    print('Cannot open door while running.');
  }

  @override
  void closeDoor() {
    print('Doors are already closed.');
  }

  @override
  void move() {
    print('Elevator is moving...');
  }
}

class StoppedState implements ElevatorState {
  @override
  void openDoor() {
    print('Opening doors...');
  }

  @override
  void closeDoor() {
    print('Closing doors...');
  }

  @override
  void move() {
    print('Starting to move...');
  }
}

class MaintenanceState implements ElevatorState {
  @override
  void openDoor() {
    print('Cannot open doors in maintenance mode.');
  }

  @override
  void closeDoor() {
    print('Cannot close doors in maintenance mode.');
  }

  @override
  void move() {
    print('Cannot move in maintenance mode.');
  }
}

class ElevatorContext {
  ElevatorState _state;

  ElevatorContext(this._state);

  void setState(ElevatorState state) {
    _state = state;
    print('Elevator state changed to: ${state.runtimeType}');
  }

  void openDoor() => _state.openDoor();
  void closeDoor() => _state.closeDoor();
  void move() => _state.move();
}

void main() {
  // 初始化电梯状态为 StoppedState
  ElevatorContext elevator = ElevatorContext(StoppedState());

  elevator.openDoor(); // 输出：Opening doors...
  elevator.move(); // 输出：Starting to move...

  // 切换到 RunningState
  elevator.setState(RunningState());
  elevator.openDoor(); // 输出：Cannot open door while running.
  elevator.move(); // 输出：Elevator is moving...

  // 切换到 MaintenanceState
  elevator.setState(MaintenanceState());
  elevator.move(); // 输出：Cannot move in maintenance mode.
}
