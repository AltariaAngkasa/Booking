// import 'package:aplikasi/screens/auth/login_page.dart';
// import 'package:aplikasi/screens/auth/registration_page.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//   debugShowCheckedModeBanner: false,
//   title: 'Flutter Login UI',
//   theme: ThemeData.light(), // your “light” fallback
//   darkTheme: ThemeData.dark().copyWith(
//     scaffoldBackgroundColor: Colors.black,
//   ),
//   themeMode: ThemeMode.dark, // ← force dark everywhere
//     home: const LoginPage(),
//   );
//   }
// }

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



// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'screens/wrapper.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User?>(
//       create: (_) => FirebaseAuth.instance.authStateChanges(),
//       initialData: null,
//       child: MaterialApp(
//         title: 'Registrasi Lengkap App',
//         home: const LoginPage(),
//       ),
//     );
//   }
// }