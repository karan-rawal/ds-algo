// Given an array cell[] of N elements,
// which represent the positions of the cells in a prison.
// Also, given an integer P which is the number of prisoners,
// the task is to place all the prisoners in the cells in an
// ordered manner such that the minimum distance between any
// two prisoners is as large as possible.
// Finally, print the maximized distance.

// E.g.
// cell = [1, 2, 8, 4 ,9 ], P = 3
// Answer = {1, 4, 8}
// with minimum distance = 3(i.e. 4 - 1) which is maximum possible.;

import 'dart:io';

Map<int, List<int>> digitSumMap = {};

List<int> cellPlacement = [];

main(List<String> args) {
  List<int> cells = acceptCells();
  int numOfPrisoners = acceptNumberOfPrisoners();

  int startIndex = 0;
  int endIndex = cells.length - 1;

  cellPlacement.add(cells[0]);
  startPlacement(cells, numOfPrisoners, startIndex, endIndex);

  displayCellPlacement();
  displayMinimumDistance();
}

int acceptNumberOfPrisoners() {
  stdout.writeln("Enter the number of prisoners:");
  int numOfPrisoners = int.parse(stdin.readLineSync());
  return numOfPrisoners;
}

List<int> acceptCells() {
  stdout.writeln("Enter the cells:");
  List<String> stringCells = stdin.readLineSync().split(' ');
  List<int> cells = stringCells.map((stringCell) {
    return int.parse(stringCell);
  }).toList();
  cells.sort();
  return cells;
}

bool canPlace(index, cells) {
  return !cellPlacement.contains(cells[index]);
}

void startPlacement(
  List<int> cells,
  int numOfPrisoners,
  int startIndex,
  int endIndex,
) {
  if (numOfPrisoners == cellPlacement.length) {
    return;
  }

  if (canPlace(endIndex, cells)) {
    cellPlacement.add(cells[endIndex]);
  }
  endIndex = ((startIndex + endIndex) ~/ 2);
  startPlacement(cells, numOfPrisoners, startIndex, endIndex);
}

void displayCellPlacement() {
  stdout.writeln("Cell placements: ");
  print(cellPlacement);
}

void displayMinimumDistance() {
  int minDist;
  cellPlacement.sort();
  for (int i = 0; i < cellPlacement.length - 1; i++) {
    int distance = cellPlacement[i + 1] - cellPlacement[i];
    if (minDist == null || minDist > distance) {
      minDist = distance;
    }
  }
  stdout.writeln("Minimum distance which is maximized: $minDist");
}
