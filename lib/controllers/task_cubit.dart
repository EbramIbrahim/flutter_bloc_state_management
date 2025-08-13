import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/model/task_model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(String title) {
    TaskModel taskModel = TaskModel(id: Uuid().v4(), title: title, isCompleted: false);
    emit(UpdateTask(List.from(state.taskList)..add(taskModel)));
  }

  // [...state.taskList, taskModel]  spread operator

  removeTask(String id) {
    final List<TaskModel> newList =
        state.taskList.where((task) => task.id != id).toList();
    emit(UpdateTask(newList));
  }

  toggleTask(String id) {
    final List<TaskModel> newList =
        state.taskList.map((task){
          return task.id == id ? task.copyWith(isCompleted: !task.isCompleted) : task;
        }).toList();
    emit(UpdateTask(newList));
  }
}
