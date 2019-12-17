import 'dart:io';

class CustomArray {
  int end = -1;
  List<int> array;
  int size;

  CustomArray(size) {
    this.size = size;
    array = List.filled(size, null);
  }

  bool isFull() {
    return end == size - 1;
  }

  bool isEmpty() {
    return end == -1;
  }

  bool insert(int value) {
    if (isFull()) {
      return false;
    }
    this.end++;
    this.array[this.end] = value;
    return true;
  }

  bool insertAt(int value, int pos) {
    if (pos < 0 || pos > end) {
      return false;
    }
    for (int i = end; i >= pos; i--) {
      this.array[i + 1] = this.array[i];
    }

    this.array[pos] = value;
    this.end++;
    return true;
  }

  bool delete() {
    if (this.end == -1) {
      return false;
    }
    this.array[this.end--] = null;
    return true;
  }

  void display() {
    if (end == -1) {
      stdout.writeln("Array is empty");
    } else {
      for (int i = 0; i <= end; i++) {
        stdout.write("${this.array[i]} ");
      }
    }
  }

  bool reverse() {
    if (end == -1) {
      return false;
    } else {
      for (int i = 0; i <= end / 2; i++) {
        int temp = this.array[i];
        this.array[i] = this.array[this.end - i];
        this.array[this.end - i] = temp;
      }
      return true;
    }
  }

  void rotate(int rotateBy) {
    List<int> temp = [];

    // Time complexity is O(n * d), d = rotateBy
    // // store first rotateBy elements in temp
    // for (int i = 0; i < rotateBy; i++) {
    //   temp.add(this.array[i]);
    // }

    // // shift current array elements to the left rotateBy times.
    // for (int j = 0; j < rotateBy; j++) {
    //   for (int i = 1; i <= this.end; i++) {
    //     this.array[i - 1] = this.array[i];
    //   }
    // }

    // // append the array at the end.
    // int insertPos = (this.end - (rotateBy - 1));
    // for (int i = 0; i < rotateBy; i++) {
    //   this.array[insertPos] = temp[i];
    //   insertPos++;
    // }

    // Time complexity is O(n) - My way
    rotateBy = rotateBy % (this.end + 1);
    for (int i = 0; i <= this.end; i++) {
      if (i < ((this.end + 1) - rotateBy)) {
        temp.add(this.array[i + rotateBy]);
      } else {
        temp.add(this.array[i - ((this.end + 1) - rotateBy)]);
      }
    }
    this.array = temp;
  }

  int count() {
    return this.end + 1;
  }
}

main(List<String> args) {
  String choice;
  CustomArray array = CustomArray(10);
  do {
    stdout.writeln("Hi! Please select an option");
    stdout.writeln("1. Insert at last.");
    stdout.writeln("2. Delete from last.");
    stdout.writeln("3. Display");
    stdout.writeln("4. Count");
    stdout.writeln("5. Insert at position.");
    stdout.writeln("6. Array reverse.");
    stdout.writeln("7. Rotate array.");
    stdout.writeln("-1. Exit");

    choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.writeln("Please enter a value.");
        String valueString = stdin.readLineSync();
        int value = int.parse(valueString);
        array.insert(value);
        break;
      case '2':
        array.delete();
        break;
      case '3':
        stdout.writeln("Displaying.... \n");
        array.display();
        stdout.writeln("\n\n");
        break;
      case '4':
        print(array.count());
        break;
      case '5':
        stdout.writeln("Enter the value and pos.");
        List<String> arr = stdin.readLineSync().split(" ");
        int val = int.parse(arr[0]);
        int pos = int.parse(arr[1]);
        array.insertAt(val, pos);
        stdout.writeln("Inserted");
        break;
      case '6':
        array.reverse();
        stdout.writeln("Reversed");
        break;
      case '7':
        stdout.writeln("Rotate by? \n");
        int rotateBy = int.parse(stdin.readLineSync());
        array.rotate(rotateBy);
        break;
    }
  } while (choice != "-1");

  stdout.writeln("\n\n\n BYE!!! \n\n\n");
}
