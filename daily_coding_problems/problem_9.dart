/**
 * 
 * Given a list of integers, write a function that returns the largets sum of
 * non-adjacent numbers. Numbers can be 0 or negative.
 * 
 * For example [2, 4, 6, 2, 5] should return [13], sinze we pick 2, 6, and 5.
 * [5, 1, 1, 5] should return 10 sinze we pick 5 and 5.
 * 
 * [6, 9, 21, 4, 6, 6] = 33
 */

int max(int a, int b) {
  return a > b ? a : b;
}

int max_sum(List<int> arr, int i) {
  if (i == 0) {
    return arr[i];
  }
  if (i == 1) {
    return max(arr[0], arr[1]);
  }

  return max(max_sum(arr, i - 1), arr[i] + max_sum(arr, i - 2));
}

void main(List<String> args) {
  List<int> arr = [5, 1, 1, 5];
  print(max_sum(arr, arr.length - 1));
}
