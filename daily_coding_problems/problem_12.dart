/**
 * Hard - Amazon
 * 
 * There exists a staircase with N steps, and you can climb up either 1 or 2 steps at a time.
 * Given N, write a function that returns the number of unique ways you can climb the staircase.
 * The order of the steps matters.abstract
 * 
 * For examples, if N is 4, then there are 5 unique ways:
 * 
 * 1 1 1 1 1
 * 2 1 1
 * 1 2 1
 * 1 1 2
 * 2 2
 * 
 * What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number
 * from a set of positive integers X? For example, if X = {1, 3, 5} you could climb 1,3 or 5 
 * steps at a time.
 */

Map<int, int> memo = {};

int numOfWays(int n, List<int> steps) {
  if (memo[n] != null) {
    return memo[n];
  }
  if (n < 0) {
    memo[n] = 0;
    return 0;
  }
  if (n == 0) {
    memo[n] = 1;
    return 1;
  }

  int sum = 0;
  for (int i = 0; i < steps.length; i++) {
    sum += numOfWays(n - steps[i], steps);
  }
  memo[n] = sum;
  return sum;
}

void main(List<String> args) {
  int n = 2;
  print(numOfWays(n, [1, 2]));
}
