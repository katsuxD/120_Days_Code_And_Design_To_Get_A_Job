// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeteleted;
  bool? isFavorite;
  Task({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    this.isDone,
    this.isDeteleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeteleted = isDeteleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeteleted,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeteleted: isDeteleted ?? this.isDeteleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeteleted': isDeteleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'],
      isDeteleted: map['isDeteleted'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props =>
      [title, description, id, date, isDone, isDeteleted, isFavorite,];
}
