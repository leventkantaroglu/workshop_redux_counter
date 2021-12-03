import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:workshop_redux_counter/redux/enum.dart';
import 'package:workshop_redux_counter/redux/reducer.dart';

import 'redux/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    counterReducer,
    initialState: AppState(counter: 0),
  );
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.counter,
      builder: (context, int count) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
          floatingActionButton: ButtonBar(
            children: [
              FloatingActionButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(
                    CounterActions.increament,
                  );
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(
                    CounterActions.decrement,
                  );
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          /* ALTERNATIVE METHOD:
            floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(CounterActions.increament);
            },
            builder: (context, callback) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ), */
        );
      },
    );
  }
}
