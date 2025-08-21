import 'package:booking_app/core/theme/custom_themes.dart';
import 'package:booking_app/features/auth/bloc/auth_bloc.dart';
import 'package:booking_app/features/auth/repository/auth_repository.dart';
import 'package:booking_app/features/home/bloc/home_bloc.dart';
import 'package:booking_app/features/home/bloc/home_event.dart';
import 'package:booking_app/features/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/home/views/home_page.dart';

Future<void> main() async {
  // Load .env sebelum runApp
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil base URL dari .env
    final baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    final apiKey = dotenv.env['APP_API_KEY'] ?? '';

    // Buat repository dengan baseUrl
    final authRepository = AuthRepository(baseUrl:baseUrl, apiKey: apiKey);
    final homeRepository = HomeRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(authRepository),
        ),
        BlocProvider(
          create: (context) => HomeBloc(homeRepository)..add(LoadHomeData()),
        ),
      ],
      child: MaterialApp(
        theme: buildAppTheme(),
        title: 'BLoC Auth',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
