import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String name;

  Task({required this.name}) : id = uuid.v4();
}
