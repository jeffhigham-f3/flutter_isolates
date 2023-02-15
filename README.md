# Flutter Isolates

Example counter app using isolates to process data. For demonstration only, generally you should never need to spawn a dedicated Isolate.

<p align="center">
<a href="https://youtu.be/UzoWGTAEzyM" target="_blank"><img style="border: 2px solid #000; margin-top: 20px; margin-bottom: 20px; border-radius: 6px; width: 50%; @media only screen and (max-width: 600px) { width: 90%;}" src="[media/flutter_watch.png](https://img.youtube.com/vi/UzoWGTAEzyM/maxresdefault.jpg
)"/>
</p></a>

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
        await compute(
          (int c) {
            sleep(const Duration(seconds: 1));
            return c + 1;
          },
          state,
        ),
      );

  void decrement() async => emit(
        await compute((int c) => c - 1, state),
      );
}

```
