import 'package:mobx/mobx.dart';

//reference the mobx generated code in your store
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

// An abstract class is a type of class that cannot be instantiated directly which means an object cannot be created from it.
// An abstract class cannot be instantiated but they can be sub-classed.
abstract class _Counter with Store {
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }

  @action
  void decrement() {
    count--;
  }
}

//generate the mobx code by typing this command:
// flutter packages pub run build_runner watch
