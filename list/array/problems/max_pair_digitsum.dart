// Maximum sum of two elements whose digit sum is equal
// Given an array arr[] of N positive elements,
// the task is to find a pair in the array such
// that the digit sum of elements in the pair are equal
// and their sum is maximum. Print -1 if it is not possible
// to find the pair else print the maximum sum.
import 'dart:io';

main(List<String> args) {
  stdout.writeln("Enter the elements: ");
  List<String> stringElements = stdin.readLineSync().split(' ').toList();
  List<int> elements = stringElements.map((elem) => int.parse(elem)).toList();
  int maxSum = getMaximumSum(elements);
  stdout.writeln("Maximum sum: $maxSum");
}

Map<int, int> map = {};

int max(int a, int b) {
  return a >= b ? a : b;
}

int digitSum(int number) {
  int ans = 0;
  while (number != 0) {
    ans = ans + number % 10;
    number = number ~/ 10;
  }
  return ans;
}

int getMaximumSum(List<int> elements) {
  int ans = -1;

  elements.forEach((element) {
    int sumOfDigits = digitSum(element);
    if (map[sumOfDigits] != null) {
      ans = max(ans, map[sumOfDigits] + element);
    }
    if (map[sumOfDigits] == null) {
      map[sumOfDigits] = element;
    } else {
      map[sumOfDigits] = max(map[sumOfDigits], element);
    }
  });

  return ans;
}
