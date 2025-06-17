import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
    bool? routerNavigator,
  }) {
    return Navigator.of(this, rootNavigator: routerNavigator ?? false)
        .pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntill(
    String routeName, {
    Object? arguments,
    bool? routerNavigator,
    bool Function(Route<dynamic>)? predicate, // Changed this parameter
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();
  void popAlert() => Navigator.of(this, rootNavigator: true).pop();
}
extension StringExtension on String? {
  bool isNotEmptyOrNull() => this == null || this == " ";
}

extension ToArabic on String? {
  String toArabicTime() {
    if (this == null || this!.isEmpty) return '';

    // Parse the time format like "1h 24m" or "2h 15m"
    final regex = RegExp(r'(\d+)\s*h\s*(\d+)?\s*m?');
    final match = regex.firstMatch(this!);

    if (match == null) return '';

    // Get hours and minutes from the matched groups
    final hours = int.parse(match.group(1)!);
    final minutes = match.group(2) != null ? int.parse(match.group(2)!) : 0;

    // Define Arabic time words based on singular or plural
    final hourText = hours == 1
        ? 'ساعة'
        : hours == 2
            ? "ساعتين"
            : 'ساعات';
    final minuteText = minutes == 1 ? 'دقيقة' : 'دقائق';

    // Build the Arabic time string
    String arabicTime = '';
    if (hours == 1) {
      arabicTime += hourText;
    } else if (hours == 2) {
      arabicTime += hourText;
    } else if (hours > 2) {
      arabicTime += '$hours $hourText';
    }
    if (minutes > 0) {
      if (hours > 0) {
        arabicTime += ' و';
      }
      arabicTime += '$minutes $minuteText';
    }

    return arabicTime;
  }
}

extension PrayNameArabic on String {
  String get prayNameArabic {
    switch (this) {
      case "Fajr":
        return "الفجر";
      case "Zuhr":
        return "الظهر";
      case "el3asr":
        return "العصر";
      case "Maghrib":
        return "المغرب";
      case "Isha":
        return "العشاء";
      default:
        return this;
    }
  }
}

extension ListExtension<T> on List<T>? {
  bool isNotEmptyOrNull() => this == null || this!.isEmpty;
}
