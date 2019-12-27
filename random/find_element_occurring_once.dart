main(List<String> args) {
  List<int> arr = [1, 3, 4, 2, 3, 1, 4];

  int ans = arr[0];

  // 1 ^ 1 (cancels out 1)
  // 3 ^ 3 (cancels out 3)
  // 4 ^ 4 (cancels out 4)
  // 0 ^ 2 gives 2
  for (int i = 1; i < arr.length; i++) {
    ans ^= arr[i];
  }

  print(ans);
}
