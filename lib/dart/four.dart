import 'package:date_format/date_format.dart';

class Item {
  double price;
  String name;

  Item(this.name, this.price);
}

class ShopCart {
  String name;
  DateTime date;
  String code;
  List<Item> bookings;

  price() {
    double sum = 0.0;
    for (var item in bookings) {
      sum += item.price;
    }
    return sum;
  }

  ShopCart(name, code) {
    this.name = name;
    this.code = code;
    this.date = DateTime.now();
  }

  getInfo() {
    return """   购物信息：
                 ----------- 
                 用户名：$name
                 优惠码：$code
                 总计：${price().toString()}
                 日期：${date.toString()}
                 -----------
    """;
  }
}

main() {
  ShopCart shopCart = new ShopCart('Mike', '235434453');
  shopCart.bookings = [Item('apple', 12), Item('banana', 34)];
  print('${shopCart.getInfo()}');
}
