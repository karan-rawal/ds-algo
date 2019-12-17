// Check if a given string contains all the digits [0-9]

import 'dart:io';

main(List<String> args) {
  stdout.writeln("Enter the string:");
  String str = stdin.readLineSync();

  String ans = checkDigitsPresence(str);
  stdout.writeln(ans);
}

Set set = new Set();

String checkDigitsPresence(String str) {
  for (int i = 0; i < str.length; i++) {
    try {
      int num = int.parse(str[i]);
      set.add(num);
    } catch (e) {}
  }

  return set.length == 10 ? 'yes' : 'no';
}
