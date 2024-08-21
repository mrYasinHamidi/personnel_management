import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalDataSource {
  late final Box _box;
  final String _boxKey;

  LocalDataSource(String storageKey) : _boxKey = storageKey;

  Future<void> ensureInitialized() async {
    _box = await Hive.openBox(_boxKey);
  }

  Future<void> write(String key, dynamic value) {
    return _box.put(key, value);
  }

  T read<T>(String key) {
    return _box.get(key);
  }

  Future<void> clear() => _box.clear();

}
