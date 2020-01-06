import 'Utils.dart';

class Mate {
  double price;
  String name;

  Mate(this.name, this.price);
}

class Item extends Mate {
  Item(String name, price) : super(name, price);

  // 重载 + 运算符
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

class ShopCart extends Mate with PrinterHelper {
  DateTime date;
  String code;
  List<Item> bookings;

  // 将原来的 price() 方法改造成 price 属性的 get 方法
//  double get price {
//    double sum = 0.0;
//    for (var item in bookings) {
//      sum += item.price;
//    }
//    return sum;
//  }
  //reduce 的参数为函数
  double get price =>
      bookings.reduce((value, element) => value + element).price;

  // 在真正执行构造函数之前可以对成员变量进行赋值
//  ShopCart({name})
//      : date = DateTime.now(),
//        super(name, 0);

  //默认初始化方法，转发到withCode里
  ShopCart({name}) : this.withCode(name: name, code: null);

  //withCode初始化方法，使用语法糖和初始化列表进行赋值，并调用父类初始化方法
  ShopCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  @override
  getInfo() {
    return """   购物信息：
                 ----------- 
                 用户名：$name
                 优惠码：${code ?? "没有"}
                 总计：$price
                 日期：$date
                 -----------
    """;
  }
}
main() {
  ShopCart.withCode(name: 'Mike', code: '235434453')
    ..bookings = [Item('apple', 12.0), Item('banana', 34.0)]
    ..printInfo();

  ShopCart(name: "Tom")
    ..bookings = [Item('西瓜', 23.0), Item('栗子', 30.0)]
    ..printInfo();
}
