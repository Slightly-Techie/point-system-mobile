import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_system_mobile/app.dart';
import 'package:point_system_mobile/src/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadConfigs();

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> loadConfigs() async {
  final prefs = AppPreferences();
  await prefs.init();
}
