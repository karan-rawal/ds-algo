/**
 * Hard - Amazon
 * 
 * Given an integer k and a string s, fing the length of the longest
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

// naive way - kind of brute force and slow
// checking for each substring. // TODO maybe find a better way.
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

void main(List<String> args) {
  String str = 'abcba';
  int k = 2;
  print(length(str, str.length, k));
}
