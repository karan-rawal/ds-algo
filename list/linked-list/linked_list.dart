import 'dart:io';

class Node<T> {
  T data;
  Node<T> next;

  Node(T data, Node<T> next) {
    this.data = data;
    this.next = next;
  }
}

class LinkedList<T> {
  Node<T> head;

  bool isEmpty() {
    return head == null;
  }

  bool add(T data) {
    Node<T> newNode = new Node(data, null);
    if (head == null) {
      head = newNode;
    } else {
      Node<T> node = head;
      while (node.next != null) {
        node = node.next;
      }
      node.next = newNode;
    }
    return true;
  }

  bool _deleteAt(int position) {
    if (isEmpty()) {
      return false;
    }
    if (position == 0) {
      head = head.next;
      return true;
    }

    Node<T> tempNode = head;
    for (int i = 0;
        i < position - 1 && tempNode != null;
        i++, tempNode = tempNode.next);

    // position out of bound.
    if (tempNode.next == null) {
      return false;
    }

    tempNode.next = tempNode.next.next;
    return true;
  }

  bool _deleteLast() {
    if (isEmpty()) {
      return false;
    }

    Node<T> node = head;

    if (head.next == null) {
      head = null;
      return true;
    }

    while (node.next.next != null) {
      node = node.next;
    }
    node.next = null;
    return true;
  }

  bool delete(int pos) {
    if (pos != null) {
      return _deleteAt(pos);
    } else {
      return _deleteLast();
    }
  }

  void display() {
    List<T> temp = [];
    for (Node<T> node = head; node != null; node = node.next) {
      temp.add(node.data);
    }
    print("Displaying: \n");
    print(temp);
    print("\n");
  }

  int count() {
    int cnt = 0;
    Node<T> tempNode = head;
    while (tempNode != null) {
      cnt++;
      tempNode = tempNode.next;
    }
    return cnt;
  }

  int search(T data) {
    if (isEmpty()) {
      return -1;
    }

    int pos = 0;
    Node<T> tempNode = head;
    while (tempNode != null) {
      if (tempNode.data == data) {
        return pos;
      }
      pos++;
      tempNode = tempNode.next;
    }

    return -1;
  }
}

main(List<String> args) {
  String choice;
  LinkedList<int> linkedList = new LinkedList();
  do {
    stdout.writeln("Hi! Please select an option");
    stdout.writeln("1. Add.");
    stdout.writeln("2. Display");
    stdout.writeln("3. Delete (pos)");
    stdout.writeln("4. Count");
    stdout.writeln("5. Search");
    stdout.writeln("-1. Exit");

    choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.writeln("Please enter a value.");
        String valueString = stdin.readLineSync();
        int value = int.parse(valueString);
        linkedList.add(value);
        break;
      case '2':
        linkedList.display();
        break;
      case '3':
        stdout.writeln("Enter the position to delete: ");
        String position = stdin.readLineSync();
        if (position == null || position == "") {
          linkedList.delete(null);
        } else {
          linkedList.delete(int.parse(position));
        }
        break;
      case '4':
        stdout.writeln("Count is ${linkedList.count()} ");
        break;
      case '5':
        stdout.writeln("Enter the number to be searched:");
        int search = int.parse(stdin.readLineSync());
        stdout.writeln("Found at ${linkedList.search(search)}");
        break;
    }
  } while (choice != "-1");

  stdout.writeln("\n\n\n BYE!!! \n\n\n");
}
