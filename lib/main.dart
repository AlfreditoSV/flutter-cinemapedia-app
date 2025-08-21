import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia_app/config/routes/app_router.dart';
import 'package:cinemapedia_app/presentation/providers/home/app_theme_notifier.dart';


Future main()async {
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme=ref.watch(appThemeNotifierProvider);
    return MaterialApp.router(
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: appTheme.appTheme(),
    );
  }
}
