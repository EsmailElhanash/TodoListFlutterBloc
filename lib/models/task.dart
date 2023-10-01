class Task {
  int? id; // Unique identifier for the task
  String description; // Description of the task
  bool isCompleted; // Indicates if the task is completed

  Task({
    this.id,
    required this.description,
    required this.isCompleted,
  });

  // Convert a Task object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0, // Store as 1 for true, 0 for false
    };
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  // Create a Task object from a Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1, // Convert 1 to true, 0 to false
    );
  }
}
