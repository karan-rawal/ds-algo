import 'dart:io';

int mod(int a) {
  if (a < 0) {
    return -1 * a;
  }
  return a;
}

int findMissingPositiveInteger(List<int> input) {
  bool oneExists = false;
  for (int i = 0; i < input.length; i++) {
    if (input[i] == 1) {
      oneExists = true;
      break;
    }
  }

  if (!oneExists) {
    return 1;
  }

  int j = 0;
  // shift all negatives to the left.
  for (int i = 0; i < input.length; i++) {
    if (input[i] <= 0 || input[i] >= input.length) {
      int temp = input[j];
      input[j] = input[i];
      input[i] = temp;
      j++;
    }
  }

  // process all right elements.
  for (int i = j; i < input.length; i++) {
    if (input[i] < input.length) {
      input[mod(input[i])] = -1 * input[mod(input[i])];
    }
  }

  // return the index of the element with a positive integer.
  for (int i = j; i < input.length; i++) {
    if (input[i] > 0) {
      return i;
    }
  }

  return input.length;
}

main(List<String> args) {
  List<int> input = [3, 4, -1, 1];
  stdout.writeln(findMissingPositiveInteger(input));
}
