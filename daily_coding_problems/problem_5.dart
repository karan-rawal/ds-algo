Function cons(int a, int b) {
  return (Function f) {
    return f(a, b);
  };
}

int car(Function f) {
  var anotherFunction = (int a, int b) {
    return a;
  };
  return f(anotherFunction);
}

int cdr(Function f) {
  var anotherFunction = (int a, int b) {
    return b;
  };
  return f(anotherFunction);
}

main(List<String> args) {
  print(car(cons(3, 4)));
  print(cdr(cons(3, 4)));
}
