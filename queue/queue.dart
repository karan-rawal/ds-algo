import 'dart:io';

class Queue<T> {
  List<T> _data;
  int front;
  int rear;

  Queue(int size) {
    _data = List.filled(size, null);
    front = rear = -1;
  }

  bool isEmpty() {
    return (front == rear);
  }

  bool isFull() {
    return rear == (_data.length - 1);
  }

  bool enqueue(T data) {
    if (isFull()) {
      throw new Exception("Queue is full.");
    }
    _data[++rear] = data;
    return true;
  }

  T dequeue() {
    if (isEmpty()) {
      throw new Exception("Queue is empty.");
    }
    return _data[++front];
  }

  @override
  String toString() {
    var data = _data.sublist(front + 1, rear + 1);
    return data.toString() + " Front: ${front}, Rear: ${rear}";
  }
}

main(List<String> args) {
  String choice;
  Queue<String> queue = new Queue(4);
  do {
    stdout.writeln("Please select an option");
    stdout.writeln("1. Enqueue.");
    stdout.writeln("2. Dequeue.");
    stdout.writeln("3. Display.");
    stdout.writeln("-1. Exit");

    choice = stdin.readLineSync();
    try {
      switch (choice) {
        case '1':
          stdout.writeln("Enter a value:");
          String val = stdin.readLineSync();
          queue.enqueue(val);
          break;
        case '2':
          queue.dequeue();
          break;
        case '3':
          stdout.writeln(queue);
          break;
      }
    } catch (e) {
      stdout.writeln(e);
    }
  } while (choice != "-1");

  stdout.writeln("\n\n\n BYE!!! \n\n\n");
}
