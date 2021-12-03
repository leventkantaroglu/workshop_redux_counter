import 'app_state.dart';
import 'enum.dart';

AppState counterReducer(AppState state, dynamic action) {
  if (action == CounterActions.increament) {
    var _state = state;
    _state.counter += 1;
    return _state;
  } else if (action == CounterActions.decrement) {
    var _state = state;
    _state.counter -= 1;
    return _state;
  }
  return state;
}
