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

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aplikasi/screens/auth/otp_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load file .env
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Test',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const OtpPage(
        phoneNumber: '08123456789',
      ),
    );
  }
}
