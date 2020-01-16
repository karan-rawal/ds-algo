import 'dart:async';

/**
 * MEDIUM - Apple
 * 
 * Implement a job scheduler which takes in a function f and an integer n,
 * and calls f after n milliseconds.
 * 
 */

class Scheduler {
  void schedule(Function() f, int n) {
    Timer(Duration(milliseconds: n), f);
  }
}

void main(List<String> args) {
  Scheduler jobScheduler = Scheduler();
  jobScheduler.schedule(() {
    print("Executed");
  }, 5000);
}
