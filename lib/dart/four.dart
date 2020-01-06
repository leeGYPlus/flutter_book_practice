import 'package:date_format/date_format.dart';

class Mate {
  double price;
  String name;

  Mate(this.name, this.price);
}

class Item extends Mate {
  Item(String name, price) : super(name, price);
  // 重载 + 运算符
  Item operator +(Item item) => Item(name + item.name,price + item.price);
}

class ShopCart extends Mate {
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
  double get price => bookings.reduce((value, element)=>value + element).price;


  // 在真正执行构造函数之前可以对成员变量进行赋值
  ShopCart(name, this.code)
      : date = DateTime.now(),
        super(name, 0);

  getInfo() {
    return """   购物信息：
                 ----------- 
                 用户名：$name
                 优惠码：$code
                 总计：${price.toString()}
                 日期：${date.toString()}
                 -----------
    """;
  }
}

main() {
  ShopCart shopCart = new ShopCart('Mike', '235434453');
  shopCart.bookings = [Item('apple', 12.0), Item('banana', 34.0)];
  print('${shopCart.getInfo()}');
}
