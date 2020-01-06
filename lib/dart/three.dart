class Point {
  num x = 0, y = 0;

  void printInfo() => print('x is $x,y is $y');
}

// 继承
class Vector extends Point {
  num z = 0;

  // 覆写父类的方法
  @override
  void printInfo() => print('x is $x,y is$y,z is $z');
}

// 实现，需要重新声明父类的成员变量以及方法
class Coordinate implements Point {
  num x = 0, y = 0;

  void printInfo() => print('x is $x,y is $y');
}

class WithCoordinate with Point {
  @override
  void printInfo() => print("with x is $x,y is $y");
}

main() {
  var vector = Vector();
  vector
    ..x = 0
    ..y = 2
    ..z = 3;//级联运算符，等同于vector.x=0; vector.y=2;vector.z=3;
  vector.printInfo();

  Coordinate coordinate = new Coordinate();
  coordinate
    ..x = 23
    ..y = 90;
  coordinate.printInfo();

  var withCoordinate = WithCoordinate();
  withCoordinate
    ..x = 2
    ..x = 98;
  withCoordinate.printInfo();
}
