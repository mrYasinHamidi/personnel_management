import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:uni_links/uni_links.dart';

typedef IntentCallback = Function(Uri? uri);

class IntentHandler {
  static final IntentHandler instance = IntentHandler._internal();

  factory IntentHandler() {
    return instance;
  }

  IntentHandler._internal();

  final Map<String, StreamSubscription> _listeners = {};

  void listenOnce({
    required String tag,
    required IntentCallback onSuccess,
    required VoidCallback onFail,
  }) {
    listen(
      tag: tag,
      onSuccess: (Uri? uri) {
        onSuccess(uri);
        cancel(tag);
      },
      onFail: () {
        onFail();
        cancel(tag);
      },
    );
  }

  Future<Uri?> listenSync() async {
    final uri = await uriLinkStream.firstWhere((element) => true);
    return uri;
  }

  void listen({
    required String tag,
    required IntentCallback onSuccess,
    required VoidCallback onFail,
  }) {
    _listeners[tag] ??= uriLinkStream.listen(
      (Uri? uri) => onSuccess(uri),
      onError: (error, trace) => onFail(),
    );
  }

  Future<void> cancel(String tag) async {
    await _listeners[tag]?.cancel();
    _listeners.remove(tag);
  }
}
