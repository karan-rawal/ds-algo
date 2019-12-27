main(List<String> args) {
  List<int> arr = [1, 2, 3, 5];

  int xOrOfN = 1;

  for (int i = 2; i <= arr.length + 1; i++) {
    xOrOfN ^= i;
  }

  int xOrOfArr = arr[0];
  for (int i = 1; i < arr.length; i++) {
    xOrOfArr ^= arr[i];
  }

  print(xOrOfArr ^ xOrOfN);
}
