import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum MonitoringType { temperature, blood, heart, breathing }

class MonitoringEntity {
  int id;
  DateTime createdTime;
  MonitoringType type;
  int inputNumber;

  MonitoringEntity(
      {required this.id,
      required this.createdTime,
      required this.type,
      required this.inputNumber});

  factory MonitoringEntity.fromJson(Map<String, dynamic> json) {
    return MonitoringEntity(
        id: json['id'],
        createdTime: DateTime.parse(json['created_time']),
        type: MonitoringType.values[json['type']],
        inputNumber: json['input_number']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_time': createdTime.toIso8601String(),
      'type': type.index,
      'input_number': inputNumber
    };
  }

  bool get isToday {
    final now = DateTime.now();
    return createdTime.year == now.year &&
        createdTime.month == now.month &&
        createdTime.day == now.day;
  }

  String get time {
    return DateFormat('yyyy/MM/dd HH:mm').format(createdTime);
  }

  String get unit {
    switch (type) {
      case MonitoringType.temperature:
        return '°C';
      case MonitoringType.blood:
        return '%';
      case MonitoringType.heart:
        return 'BPM';
      case MonitoringType.breathing:
        return 'times';
    }
  }

  Image get icon {
    switch (type) {
      case MonitoringType.temperature:
        return Image.asset('assets/temperature.webp',width: 62,height: 62,);
        case MonitoringType.blood:
          return Image.asset('assets/blood.webp',width: 62,height: 62,);
        case MonitoringType.heart:
          return Image.asset('assets/heart.webp',width: 62,height: 62,);
        case MonitoringType.breathing:
          return Image.asset('assets/breathing.webp',width: 62,height: 62,);
    }
}

  bool get isNormal {
    switch (type) {
      case MonitoringType.temperature:
        return inputNumber >= 36.0 && inputNumber <= 37.5;
      case MonitoringType.blood:
        return inputNumber >= 90 && inputNumber <= 110;
      case MonitoringType.heart:
        return inputNumber >= 60 && inputNumber <= 100;
      case MonitoringType.breathing:
        return inputNumber >= 12 && inputNumber <= 20;
    }
  }

  Color get leftTitleColor {
    switch (type) {
      case MonitoringType.temperature:
        return isNormal ? Colors.green : Colors.orange;
      case MonitoringType.blood:
        return isNormal ? Colors.green : Colors.orange;
      case MonitoringType.heart:
        return isNormal ? Colors.green : Colors.orange;
      case MonitoringType.breathing:
        return isNormal ? Colors.green : Colors.orange;
    }
  }

  String get rightStatusTitle {
    switch (type) {
      case MonitoringType.temperature:
        return isNormal ? 'Normal' : 'Out';
      case MonitoringType.blood:
        return isNormal ? 'Normal' : 'Out';
      case MonitoringType.heart:
        return isNormal ? 'Normal' : 'Out';
      case MonitoringType.breathing:
        return isNormal ? 'Normal' : 'Out';
    }
  }

  Color get rightStatusColor {
    switch (type) {
      case MonitoringType.temperature:
        return isNormal ? Colors.black : Colors.orange;
      case MonitoringType.blood:
        return isNormal ? Colors.black : Colors.orange;
      case MonitoringType.heart:
        return isNormal ? Colors.black : Colors.orange;
      case MonitoringType.breathing:
        return isNormal ? Colors.black : Colors.orange;
    }
  }
}
