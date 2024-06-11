import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/Data/models/task_model.dart';
import 'package:flutter_task_manager/Data/providers/task_provider.dart';

class CreateTaskButton extends ConsumerStatefulWidget {
  const CreateTaskButton({
    super.key,
  });

  @override
  ConsumerState<CreateTaskButton> createState() => _CreateTaskButtonState();
}

class _CreateTaskButtonState extends ConsumerState<CreateTaskButton> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                      controller: nameController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Task Name'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 56),
                            backgroundColor: Colors.teal),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            ref.read(taskListingProvider.notifier).createTask(
                                  Task(name: nameController.text),
                                );
                            nameController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Create Task',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      label: const Text(
        'Add Task',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
