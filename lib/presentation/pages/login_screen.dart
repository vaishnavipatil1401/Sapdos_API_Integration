import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_state.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_button.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Color primaryColor = Color(0xFF13235A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginUserBloc, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserSuccess) {
            Navigator.pushNamed(context, '/doctor-dashboard');
          } else if (state is LoginUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Failed: ${state.error}')),
            );
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/main_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sapdos',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Enter existing account’s details',
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      CustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final loginRequest = LoginRequestModel(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            BlocProvider.of<LoginUserBloc>(context).add(
                              LoginButtonPressed(loginRequest: loginRequest),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
