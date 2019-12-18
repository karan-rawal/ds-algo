// Maximum sum combination from the given array
// Given an array arr[] of N integers and three
// integers X, Y and Z. The task is to find the maximum
// value of (arr[i] * X) + (arr[j] * Y) + (arr[k] * Z)
// where 0 ≤ i ≤ j ≤ k ≤ N – 1.

import 'dart:io';

min(a, b) {
  return a <= b ? a : b;
}

max(a, b) {
  return a >= b ? a : b;
}

void main(List<String> args) {
  stdout.writeln("Enter the elements: ");
  String stringElements = stdin.readLineSync();
  List<int> elements = stringElements.split(' ').map((elem) {
    return int.parse(elem);
  }).toList();

  stdout.writeln("Enter the values of x, y & z: ");
  String xyz = stdin.readLineSync();
  List<int> xyzList = xyz.split(' ').map((elem) {
    return int.parse(elem);
  }).toList();

  int x = xyzList[0];
  int y = xyzList[1];
  int z = xyzList[2];

  int maxPositiveNum;
  int minNegativeNum;

  for (int i = 0; i < elements.length; i++) {
    if (maxPositiveNum == null && elements[i] >= 0) {
      maxPositiveNum = elements[i];
    }

    if (minNegativeNum == null && elements[i] < 0) {
      minNegativeNum = elements[i];
    }

    if (elements[i] < 0 && minNegativeNum != null) {
      minNegativeNum = min(minNegativeNum, elements[i]);
    }

    if (elements[i] >= 0 && maxPositiveNum != null) {
      maxPositiveNum = max(maxPositiveNum, elements[i]);
    }
  }

  int sum = 0;
  if (x >= 0) {
    sum += (maxPositiveNum * x);
  } else {
    sum += (minNegativeNum) * x;
  }

  if (y >= 0) {
    sum += (maxPositiveNum * y);
  } else {
    sum += (minNegativeNum) * y;
  }

  if (z >= 0) {
    sum += (maxPositiveNum * z);
  } else {
    sum += (minNegativeNum) * z;
  }

  stdout.writeln("Ans is $sum");
}
