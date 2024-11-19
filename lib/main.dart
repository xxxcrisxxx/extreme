import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart'; // Importa easy_localization
import 'routes/app_routes.dart';
import 'theme/app_colors.dart';

Future<void> logErrorToFile(String error, String stackTrace) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/error_log.txt';
  final file = File(path);
  await file.writeAsString('Error: $error\nStackTrace: $stackTrace\n\n', mode: FileMode.append);
  print("Error log saved at: $path");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization( 
      supportedLocales: [Locale('en', 'US'), Locale('es', 'ES')],
      path: 'lib/assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.textColor,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textColor),
          bodyMedium: TextStyle(color: AppColors.textColor),
        ),
      ),
      locale: context.locale, 
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
