import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('manager')
  manager,
  @JsonValue('employee')
  personnel,
}
