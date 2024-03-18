class Task {
  final String title;
  final String description;
  final bool isDone;

  Task({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
