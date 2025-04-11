import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utilities/app_bloc_observer.dart';
import 'core/utilities/go_router.dart';
import 'core/utilities/logger.dart';
import 'core/utilities/themes.dart';
import 'di/injection_container.dart' as di;
import 'presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'presentation/bloc/book/book_bloc.dart';
import 'presentation/cubit/theme/theme_cubit.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.transformer = bloc_concurrency.sequential();
        Bloc.observer = const AppBlocObserver();
        // Load Environment variables
        try {
          await dotenv.load(fileName: ".env"); // Load environment variables
        } catch (e) {
          throw Exception('Error loading .env file: $e'); // Print error if any
        }
        // Initialize Hive
        await Hive.initFlutter();
        di.initializeDependencies();
        runApp(const MyApp());
      },
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<AuthenticatorWatcherBloc>()),
        BlocProvider(create: (_) => di.getIt<ThemeCubit>()),
        BlocProvider(create: (_) => di.getIt<BookBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Book Buddy',
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode:
                themeState is ThemeDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: routerInit,
          );
        },
      ),
    );
  }
}
