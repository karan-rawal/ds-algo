/*
() -> 1
AB = A + B 
(A) = 2 * A
*/

String pass1(String input) {
  String output = "";
  for (int i = 0; i < input.length; i++) {
    if (input[i] == "(" && input[i + 1] == ")") {
      i++;
      output = output + "1";
    } else {
      output = output + input[i];
    }
  }
  print(output);
  return output;
}

String pass2(String input) {
  String output = "";
  for (int i = 0; i < input.length - 2; i++) {
    String temp = input.substring(i, i + 2);
    if (temp[0] == "(" && temp[2] == ")") {
      output = output + (int.parse(temp[1]) * 2).toString();
      i += 2;
    } else {
      output = output + input[i];
    }
  }
  print(output);
  return output;
}

//"(1(1))"

main(List<String> args) {
  String input = "(()(()))";
  input = pass1(input);
  pass2(input);
}

/*

"" "1"
()()


(())

1
(



****
(())

Stack (

))
Stack ((

1)
Stack (

*/
