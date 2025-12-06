import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ask_abc/providers/app_provider.dart';
import 'package:ask_abc/providers/chat_provider.dart';
import 'package:ask_abc/providers/language_provider.dart';
import 'package:ask_abc/screens/home_screen.dart';
import 'package:ask_abc/utils/app_localizations.dart';

void main() {
  runApp(const AskABCApp());
}

class AskABCApp extends StatelessWidget {
  const AskABCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          return MaterialApp(
            title: 'Ask ABC - Construction Guru',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              primaryColor: const Color(0xFFE65100),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFE65100),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              fontFamily: 'Roboto',
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Color(0xFFE65100),
                foregroundColor: Colors.white,
              ),
            ),
            locale: languageProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ur', ''),
            ],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

