import 'enum.dart';

int counterReducer(int state, dynamic action) {
  if (action == CounterActions.increament) {
    return state + 1;
  } else if (action == CounterActions.decrement) {
    return state - 1;
  }
  return state;
}
