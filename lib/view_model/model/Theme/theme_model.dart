import 'dart:convert';

import 'package:flutter/material.dart';

class ThemesModel {
  final String title;
  final ThemeMode mode;

  ThemesModel({required this.title, required this.mode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'mode': mode.name};
  }

  factory ThemesModel.fromMap(Map<String, dynamic> map) {
    return ThemesModel(
        title: (map["title"] ?? '') as String,
        mode: ThemeMode.values.firstWhere(
            (element) => element.name == map['mode'],
            orElse: () => ThemeMode.light));
  }

  String toJson() => json.encode(toMap());

  factory ThemesModel.fromJson(String source) => ThemesModel.fromMap(
      source.isEmpty ? {} : json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ThemesModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.mode == mode;
  }

  @override
  int get hashCode => title.hashCode ^ mode.hashCode;

  @override
  String toString() => 'ThemesModel(title: $title, mode: $mode)';
}


