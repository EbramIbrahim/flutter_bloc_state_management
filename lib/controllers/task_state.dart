part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> taskList;
  const TaskState(this.taskList);
  @override
  // TODO: implement props
  List<Object?> get props => [taskList];
}

final class TaskInitial extends TaskState {
  TaskInitial(): super([]);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.taskList);
}
