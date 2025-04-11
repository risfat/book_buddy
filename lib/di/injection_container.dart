import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../core/config/boxs.dart';
import '../core/network/dio_client.dart';
import '../data/datasources/local/books_local_data_source.dart';
import '../data/datasources/remote/books_remote_data_source.dart';
import '../data/datasources/repositories/book_repository_impl.dart';
import '../domain/repositories/book_repository.dart';
import '../domain/usecases/add_favorites.dart';
import '../domain/usecases/get_books.dart';
import '../domain/usecases/get_favorites.dart';
import '../domain/usecases/remove_favorites.dart';
import '../presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import '../presentation/bloc/book/book_bloc.dart';
import '../presentation/cubit/theme/theme_cubit.dart';

final getIt = GetIt.instance;

// Function to initialize the dependency injection
Future<void> initializeDependencies() async {
  setupSynchronousRegistrations();
  await setupAsynchronousRegistrations();
}

// Function to set up synchronous registrations
void setupSynchronousRegistrations() {
  // Dio
  getIt.registerLazySingleton(() => DioClient.instance);

  // // Network
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Data sources

  getIt.registerLazySingleton<BookLocalDataSource>(
    () => BookLocalDataSourceImpl(bookBox: getIt()),
  );

  getIt.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSourceImpl(),
  );

  // Repositories

  getIt.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetBooks(getIt()));
  getIt.registerLazySingleton(() => GetFavorites(getIt()));
  getIt.registerLazySingleton(() => AddToFavorites(getIt()));
  getIt.registerLazySingleton(() => RemoveFavorites(getIt()));

  // BLoCs
  getIt.registerLazySingleton(() => AuthenticatorWatcherBloc());
  getIt.registerLazySingleton(() => ThemeCubit());
  getIt.registerLazySingleton(() => BookBloc(
      getBooks: getIt(),
      getFavorites: getIt(),
      addToFavorites: getIt(),
      removeFromFavorites: getIt()));
}

Future<void> setupAsynchronousRegistrations() async {
  // Open Hive box
  final userBox = await Hive.openBox<String>(HiveBox.bookBox);
  final configBox = await Hive.openBox(HiveBox.configBox);
  // Register box in GetIt
  getIt.registerLazySingleton<Box<String>>(() => userBox);
  getIt.registerLazySingleton<Box>(() => configBox);
}
