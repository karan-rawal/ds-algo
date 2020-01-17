/**
 * Hard - Amazon
 * 
 * Given an integer k and a string s, find the length of the longest
 * substring that contains at most k distinct characters.
 * 
 * For example, given s = 'abcba' and k = 2, the longest substring with k
 * distinct characters is 'bcb'.
 * 
 */

bool isDistinctLessThanK(String str, int k) {
  Map<String, bool> map = {};
  for (int i = 0; i < str.length; i++) {
    map[str[i]] = true;
  }

  return map.length <= k;
}

int getMax(int a, int b) {
  if (a >= b) {
    return a;
  } else {
    return b;
  }
}

// one way
int length(String str, int substringLength, int k) {
  if (substringLength == 0) {
    return 0;
  }

  for (int i = 0; i + substringLength <= str.length; i++) {
    String substring = str.substring(i, i + substringLength);
    if (isDistinctLessThanK(substring, k)) {
      print(str.substring(i, i + substringLength));
      return substring.length;
    }
  }
  return length(str, substringLength - 1, k);
}

// better way O(n2)
int length2(String str, int k) {
  int max = 0;
  for (int i = 0; i < str.length; i++) {
    Map<String, bool> map = {};
    for (int j = i; j < str.length; j++) {
      map[str[j]] = true;
      if (map.length <= k) {
        max = getMax(max, (j - i) + 1);
      }
    }
  }
  return max;
}

void main(List<String> args) {
  String str = 'abcba';
  int k = 2;
  print(length(str, str.length, k));
  print(length2(str, k));
}
