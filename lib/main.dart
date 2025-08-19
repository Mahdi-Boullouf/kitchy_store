import 'package:flutter/material.dart';
import 'package:kitchy_store/app/app.bottomsheets.dart';
import 'package:kitchy_store/app/app.dialogs.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/app/app.router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale("ar"),
      supportedLocales: const [Locale("ar")],
      localizationsDelegates: const [
        // Add your localization delegates here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'Kitchy Store',
      routerDelegate: stackedRouter.delegate(initialRoutes: []),
      routeInformationParser: stackedRouter.defaultRouteParser(),
    );
  }
}
