import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeteleted;
  Task({
    required this.title,
    this.isDone,
    this.isDeteleted,
  }) {
    isDone = isDone ?? false;
    isDeteleted = isDeteleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeteleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeteleted: isDeteleted ?? this.isDeteleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeteleted': isDeteleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDeteleted: map['isDeteleted'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        isDone,
        isDeteleted,
      ];
}
