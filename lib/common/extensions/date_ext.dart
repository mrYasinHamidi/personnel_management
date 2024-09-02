import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension DateExt on Jalali {
  isValidStartDate() => isAfter(Jalali.now());

  isValidEndDate(Jalali? startDate) {
    if (startDate == null) return false;
    if (!isAfter(startDate)) return false;
    return true;
  }
}

extension TimeExt on TimeOfDay {
  isValidEndTime(TimeOfDay? startTime) {
    if (startTime == null) return null;
    if (hour < startTime.hour) return false;
    if (hour == startTime.hour && minute < startTime.minute) return false;
    return true;
  }
}
