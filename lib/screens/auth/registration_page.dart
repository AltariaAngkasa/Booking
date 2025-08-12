import 'package:aplikasi/screens/auth/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Registration UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late String apiUrl;
  late String apiKey;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    apiUrl = dotenv.env['API_URL_REGISTER'] ?? '';
    apiKey = dotenv.env['API_KEY'] ?? '';
  }

  Future<void> _register() async {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
    // if (_passwordController.text != _confirmPasswordController.text) {
    //   _showError("Password dan konfirmasi tidak sama");
    //   return;
    // }

    // if (apiUrl.isEmpty || apiKey.isEmpty) {
    //   _showError("API URL atau API Key belum diatur di .env");
    //   return;
    // }

    // setState(() => isLoading = true);

    // try {
    //   final response = await http.post(
    //     Uri.parse(apiUrl),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'x-api-key': apiKey,
    //     },
    //     body: jsonEncode({
    //       'username': _usernameController.text.trim(),
    //       'phone': _phoneController.text.trim(),
    //       'password': _passwordController.text,
    //     }),
    //   );

    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);

    //     if (data['success'] == true) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text("Registrasi berhasil!")),
    //       );
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => const LoginPage()),
    //       );
    //     } else {
    //       _showError(data['message'] ?? 'Registrasi gagal');
    //     }
    //   } else {
    //     _showError('Gagal terhubung ke server (${response.statusCode})');
    //     print(response.statusCode);
    //     print(response.body);
    //   }
    // } catch (e) {
    //   _showError('Terjadi kesalahan: $e');
    // }

    // setState(() => isLoading = false);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Buat Akun Untuk\nMemulai!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _usernameController,
                decoration: _inputDecoration('Username'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Number Phone'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _inputDecoration('Password'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: _inputDecoration('Konfirmasi Password'),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isLoading ? null : _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5AFE),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 14),
                    children: [
                      const TextSpan(text: 'Sudah punya akun? '),
                      TextSpan(
                        text: 'Login di sini',
                        style: const TextStyle(
                          color: Color(0xFF3D5AFE),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Color(0xFF3D5AFE)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );
  }
}
