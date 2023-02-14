// ignore_for_file: avoid_void_async

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() async => emit(
        await compute((int c) => c + 1, state),
      );

  void decrement() async => emit(
        await compute((int c) => c - 1, state),
      );
}
