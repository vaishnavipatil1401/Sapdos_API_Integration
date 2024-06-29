import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/login/login_user_state.dart';
import 'package:sapdos_api_integration_assignment/data/models/login_request_model.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_button.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  final loginRequest = LoginRequestModel(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  BlocProvider.of<LoginUserBloc>(context).add(
                    LoginButtonPressed(loginRequest: loginRequest),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text('Sign-Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
