import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
//  runApp(new MyApp());
  print(await asyncFibonacci(20));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

Future<dynamic> asyncFibonacci(int n) async {
  final response = ReceivePort();
  await Isolate.spawn(_isolate, response.sendPort);
  final sendPort = await response.first as SendPort;
  final answer = new ReceivePort();
  sendPort.send([n, answer.sendPort]);
  return answer.first;
}

void _isolate(SendPort initalReplyTo) {
  final port = new ReceivePort();
  initalReplyTo.send(port.sendPort);
  port.listen((message) {
    final data = message[0] as int;
    final send = message[1] as SendPort;
    send.send(syncFibonacci(data));
  });
}

int syncFibonacci(int n) {
  return n < 2 ? n : syncFibonacci(n - 2) + syncFibonacci(n - 1);
}
