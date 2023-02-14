# Flutter Isolates

## Example counter app using isolates to process data. For demonstration only, generally you should never need to spawn a dedicated Isolate.

```dart
import 'dart:isolate';
```

```dart
void _uselessCounter(int start) {
  var count = start;
  while (true) {
    sleep(
      const Duration(
        seconds: 5,
      ),
    );
    debugPrint('isolate: $count');
    count++;
  }
}
```

```dart
  @override
  void initState() {
    super.initState();
    Isolate.spawn(_uselessCounter, 0);
  }
```

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() async => emit(
        await compute((int c) => c + 1, state),
      );

  void decrement() async => emit(
        await compute((int c) => c - 1, state),
      );
}

```
