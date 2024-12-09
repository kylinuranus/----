// 产品类
class House {
  String? foundation;
  String? walls;
  String? roof;

  @override
  String toString() => "Foundation: $foundation, Walls: $walls, Roof: $roof";
}

// 建造者接口
abstract class HouseBuilder {
  void buildFoundation();
  void buildWalls();
  void buildRoof();
  House getResult();
}

// 具体建造者
class WoodenHouseBuilder implements HouseBuilder {
  final House _house = House();

  @override
  void buildFoundation() {
    _house.foundation = "Wooden Foundation";
  }

  @override
  void buildWalls() {
    _house.walls = "Wooden Walls";
  }

  @override
  void buildRoof() {
    _house.roof = "Wooden Roof";
  }

  @override
  House getResult() => _house;
}

// 指挥者
class Director {
  final HouseBuilder builder;

  Director(this.builder);

  House construct() {
    builder.buildFoundation();
    builder.buildWalls();
    builder.buildRoof();
    return builder.getResult();
  }
}

void main() {
  WoodenHouseBuilder builder = WoodenHouseBuilder();
  Director director = Director(builder);

  House house = director.construct();
  print(
      house); // 输出: Foundation: Wooden Foundation, Walls: Wooden Walls, Roof: Wooden Roof
}
