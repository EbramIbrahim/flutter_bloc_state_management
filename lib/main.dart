import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/controllers/task_cubit.dart';
import 'package:flutter_bloc_state_management/counter_cubit.dart';
import 'package:flutter_bloc_state_management/model/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter your task'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isEmpty) return;
                context.read<TaskCubit>().addTask(controller.text);
                controller.clear();
              },
              child: const Text('Add Task'),
            ),
            Expanded(
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final controllerCubit = context.read<TaskCubit>();
                  return ListView.builder(
                    itemCount: state.taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      TaskModel task = state.taskList[index];
                      return ListTile(
                        title: Text(task.title),
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            controllerCubit.toggleTask(task.id);
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controllerCubit.removeTask(task.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
