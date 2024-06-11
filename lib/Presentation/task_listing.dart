import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/Data/providers/task_provider.dart';
import 'package:flutter_task_manager/Presentation/components/create_task_button.dart';

class TaskListing extends ConsumerWidget {
  const TaskListing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProvider = ref.watch(taskListingProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Task Manager App',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          CreateTaskButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: taskProvider.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(taskProvider[index].name),
            trailing: IconButton(
              onPressed: () {
                ref.read(taskListingProvider.notifier).removeTask(
                      taskProvider[index],
                    );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
