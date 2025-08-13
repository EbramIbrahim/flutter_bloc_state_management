part of 'counter_cubit.dart';


sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  @override
  List<Object?> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial(): super(0);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate(super.counter);
}