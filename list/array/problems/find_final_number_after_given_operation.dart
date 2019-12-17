// Find the final number obtained after
// performing the given operation
// Given an array of positive distinct integers arr[],
// the task is to find the final number obtained by
// performing the following operation on the elements
// of the array:
// Operation: Take two unequal numbers and replace the
// larger number with their difference until all
// numbers become equal.
import 'dart:io';

bool allNumbersSame(List<int> numbers) {
  bool allSame = true;
  for (int i = 1; i < numbers.length - 1; i++) {
    if (numbers[i] != numbers[i + 1]) {
      allSame = false;
      break;
    }
  }
  return allSame;
}

main(List<String> args) {
  stdout.writeln("Enter the numbers");
  String numsString = stdin.readLineSync();
  List<int> nums = numsString.split(' ').map((n) => int.parse(n)).toList();

  while (!allNumbersSame(nums)) {
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] < nums[i + 1]) {
        nums[i + 1] = nums[i + 1] - nums[i];
      } else if (nums[i] > nums[i + 1]) {
        nums[i] = nums[i] - nums[i + 1];
      }
    }
  }

  stdout.writeln("Final number is ${nums[0]}");
}
