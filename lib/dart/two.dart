class PointTwo {
  num x, y, _z;
  static num factor = 10;
  // 在构造函数真正执行之前，还有机会给实例变量赋值
  PointTwo(this.x, this.y) : _z = 0;

  // 命名构造函数，使得类的实例化过程中语义清晰
  PointTwo.bottom(num x ):this(x,0);// 重定向构造函数

  void printInfo() => print('x is $x,y is $y,z is $_z');

  static void printFactor() => print('factor is $factor');
}

main() {
//  one();
  two();
}

two(){
  var point = new PointTwo(1, 1);
  point._z = 45;
  var point2 = new PointTwo.bottom(23);

  point.printInfo();
  point2.printInfo();
}

void one() {
  var point = PointOne(1, 2);
  point.printInfo();
  PointOne.factor = 20;
  PointOne.printFactor();
}

class PointOne {
  num x, y;

  //类变量
  static num factor = 10;

  // 构造函数的语法糖，等同于以下声明
  PointOne(this.x, this.y);

//  Point(num x,num y){
//    this.x = x;
//    this.y = y;
//  }

  void printInfo() => print('x is $x,y is $y');

  static void printFactor() => print('factor is $factor');
}
