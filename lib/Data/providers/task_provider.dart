import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/Data/models/task_model.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void createTask(Task task) {
    state = [...state, task];
  }

  void removeTask(Task task) {
    if (state.contains(task)) {
      state = state.where((tsk) => tsk.id != task.id).toList();
    }
  }
}

final taskListingProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);
