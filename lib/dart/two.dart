class Point{
  num x,y;
  //类变量
  static num factor = 10;
  // 构造函数的语法糖，等同于以下声明
  Point(this.x,this.y);
//  Point(num x,num y){
//    this.x = x;
//    this.y = y;
//  }

  void printInfo() => print('x is $x,y is $y');
  static void printFactor() => print('factor is $factor');
}

main(){
  var point = Point(1,2);
  point.printInfo();
  Point.factor = 20;
  Point.printFactor();
}