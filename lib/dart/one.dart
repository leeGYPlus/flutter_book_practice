printInteger(int a) {
  print('Hello world, this is $a.');
}

main() {
//one();
  two();
}

one() {
  //  var number = 2019;
//  printInteger(number);
  var map = {"name": "tom", "age": 1};
//  map.forEach((k, v) => print('${k}: ${v}'));
  var map2 = new Map<String, String>();
  map2['name'] = 'Tom';
  map2['sex'] = 'male';
  map2.forEach((k, v) => print('$k: $v'));
//  print(map2 is Map<String, String>); // true
}

void two() {
  int x = 10;
  int y = 0;
//  printInfo(x, f); // 输出 10 is Zero: false
//  printInfo(y, f); // 输出 0 is Zero: true
  Function test2 = isMan;
  showSex("man", test);
  showSex("man", test2);
}

bool isZero(int number) {
  return number == 0;
}

bool isMan(String sex) => sex == "man";
Function test = isMan;
void showSex(String sex,Function checker){
  print('$sex isMan:${checker(sex)}');
}

Function f = isZero;


void printInfo(int number, Function check) {
  //用check函数来判断整数是否为0
  print("$number is Zero: ${check(number)}");
}

