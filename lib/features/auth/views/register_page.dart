import 'package:booking_app/core/components/base/custom_textfield.dart';
import 'package:booking_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/base/custom_appbar.dart';
import '../../../core/components/forms/form_wrapper.dart';
import '../../../core/theme/custom_themes.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  bool obsecure = true;
  IconData? icon = Icons.visibility;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    context.read<AuthBloc>().add(
      RegisterRequested(
        _nameController.text,
        _phoneController.text,
        _emailController.text,
        _passwordController.text,
        _pinController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Register berhasil")),
          );
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Register gagal")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(Assets.images.logo.path),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ZOOM",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "SPORT & ENTERTAIMENT",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.images.background.path),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Buat Akun untuk \nmemulai!",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(height: 30),
                        FormWrapper(
                          submitText: 'Daftar',
                          formKey: _formKey,
                          onSubmit: _handleRegister,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextField(
                                controller: _nameController,
                                hint: "Nama",
                                prefix: Icon(Icons.person),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Nama wajib diisi"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                controller: _phoneController,
                                hint: "Nomor Telepon",
                                prefix: Icon(Icons.phone),
                                keyboardType: TextInputType.phone,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Nomor telepon wajib diisi"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                hint: "Email",
                                prefix: Icon(Icons.mail),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Email wajib diisi"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                controller: _passwordController,
                                hint: "Password",
                                prefix: Icon(Icons.password),
                                suffix: IconButton(
                                  onPressed: () {
                                    if (obsecure == true) {
                                      obsecure = false;
                                      icon = Icons.visibility_off;
                                    } else {
                                      obsecure = true;
                                      icon = Icons.visibility;
                                    }
                                  },
                                  icon: Icon(icon),
                                ),
                                obscure: obsecure,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Password wajib diisi"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                controller: _pinController,
                                hint: "PIN",
                                keyboardType: TextInputType.number,
                                prefix: Icon(Icons.key),
                                suffix: IconButton(
                                  onPressed: () {
                                    if (obsecure == true) {
                                      obsecure = false;
                                      icon = Icons.visibility_off;
                                    } else {
                                      obsecure = true;
                                      icon = Icons.visibility;
                                    }
                                  },
                                  icon: Icon(icon),
                                ),
                                obscure: obsecure,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "PIN wajib diisi"
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              if (state.status == AuthStatus.loading)
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppSpacing.md,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            ),
        );
      },
    );
  }
}
