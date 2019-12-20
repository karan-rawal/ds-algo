import 'dart:io';

class Stack<T> {
  int _top;
  List<T> _data;

  Stack(int size) {
    _top = -1;
    _data = List.filled(size, null);
  }

  T peek() {
    if (_top == -1) {
      throw new Exception("Stack underflow.");
    }
    return _data[_top];
  }

  T pop() {
    if (_top == -1) {
      throw new Exception("Stack underflow");
    }
    return _data[_top--];
  }

  void push(T data) {
    if (_top == _data.length) {
      throw new Exception("Stack overflow");
    }
    _data[++_top] = data;
  }

  bool isEmpty() {
    return _top == -1;
  }
}

main(List<String> args) {
  String choice;
  Stack<String> stack = new Stack(10);
  do {
    stdout.writeln("Please select an option");
    stdout.writeln("1. Push.");
    stdout.writeln("2. Pop.");
    stdout.writeln("3. Peek.");
    stdout.writeln("4. isEmpty.");
    stdout.writeln("-1. Exit");

    choice = stdin.readLineSync();
    try {
      switch (choice) {
        case '1':
          stdout.writeln("Enter a value:");
          String val = stdin.readLineSync();
          stack.push(val);
          break;
        case '2':
          stack.pop();
          break;
        case '3':
          stdout.writeln("Peek: ${stack.peek()}");
          break;
        case '4':
          stdout.writeln("isEmpty: ${stack.isEmpty()}");
          break;
      }
    } catch (e) {
      stdout.writeln(e);
    }
  } while (choice != "-1");

  stdout.writeln("\n\n\n BYE!!! \n\n\n");
}
