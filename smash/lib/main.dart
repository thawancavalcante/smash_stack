import 'package:firebase_core/firebase_core.dart';
import 'package:smash/firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:smash/app_router.dart';
import 'package:smash/blocs/blocs.dart';
import 'package:smash/ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _routes = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountryBloc()..add(const CountryFetchEvent()),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Smash',
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
        ],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        onGenerateRoute: _routes.onGenerateRoute,
        onUnknownRoute: (_) => _routes.errorRoute(),
      ),
    );
  }
}
