part of 'counter_cubit.dart';


sealed class CounterState {
  final int counter;
  CounterState(this.counter);
}

final class CounterInitial extends CounterState {
  CounterInitial(): super(0);
}

final class CounterUpdate extends CounterState {
  CounterUpdate(super.counter);
}