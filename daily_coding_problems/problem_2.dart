import 'dart:io';

void way1() {
  List<int> input = [1, 2, 3, 4, 5];
  List<int> output = [];

  for (int i = 0; i < input.length; i++) {
    int product;
    for (int j = 0; j < input.length; j++) {
      if (i != j) {
        if (product == null) {
          product = input[j];
        } else {
          product = product * input[j];
        }
      }
    }
    output.add(product);
  }

  stdout.writeln("Using way 1 (Brute Force)");
  stdout.writeln(output);
}

void way2() {
  List<int> input = [1, 2, 3, 4, 5];
  List<int> output = [];

  int totalProduct;

  for (int i = 0; i < input.length; i++) {
    if (totalProduct == null) {
      totalProduct = input[i];
    } else {
      totalProduct = totalProduct * input[i];
    }
  }

  for (int i = 0; i < input.length; i++) {
    int numToExclude = input[i];
    output.add(totalProduct ~/ numToExclude);
  }

  stdout.writeln("Using way 2( Time complexity: O(n))");
  stdout.writeln(output);
}

void way2WithoutDivision() {
  List<int> input = [3, 2, 1];
  List<int> output = [];

  int totalProduct;

  for (int i = 0; i < input.length; i++) {
    if (totalProduct == null) {
      totalProduct = input[i];
    } else {
      totalProduct = totalProduct * input[i];
    }
  }

  for (int i = 0; i < input.length; i++) {
    int numToExclude = input[i];
    int divideBy = numToExclude;
    int ans = totalProduct;
    while (divideBy * ans != totalProduct) {
      ans--;
    }
    output.add(ans);
  }

  stdout.writeln("Using way 2 without division.");
  stdout.writeln(output);
}

void main(List<String> args) {
  way1();
  way2();
  way2WithoutDivision();
}
