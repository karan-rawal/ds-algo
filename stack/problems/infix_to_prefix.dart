import 'dart:io';
import '../stack.dart';

Stack<String> stack = Stack(100);

bool isOperator(String ch) {
  if (ch == '+' || ch == '-' || ch == '/' || ch == '*' || ch == '^') {
    return true;
  }
  return false;
}

bool isBraces(String ch) {
  return ch == '(' || ch == ')';
}

String reverse(String exp) {
  String output = '';
  for (int i = 0; i < exp.length; i++) {
    output = exp[i] + output;
  }
  return output;
}

Map<String, int> precedence = {
  '+': 1,
  '-': 1,
  '*': 2,
  '/': 2,
  '^': 3,
  '(': -1,
  ')': -1,
};

void main(List<String> args) {
  stdout.writeln("Enter the expression");
  String expression = stdin.readLineSync();

  expression = reverse(expression);

  String output = '';

  for (int i = 0; i < expression.length; i++) {
    String ch = expression[i];
    if (isOperator(ch)) {
      while (!stack.isEmpty() && precedence[stack.peek()] >= precedence[ch]) {
        output = output + stack.pop();
      }
      stack.push(ch);
    } else if (isBraces(ch)) {
      if (ch == ')') {
        stack.push(ch);
      } else {
        while (!stack.isEmpty() && stack.peek() != ')') {
          output = output + stack.pop();
        }
        // pop the ')'
        stack.pop();
      }
    } else {
      output = output + ch;
    }
  }

  while (!stack.isEmpty()) {
    output = output + stack.pop();
  }

  String ans = reverse(output);
  stdout.writeln(ans);
}

// a+b*c
// a+*bc
// +a*bc
