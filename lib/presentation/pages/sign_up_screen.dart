//sign_up_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_bloc.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_event.dart';
import 'package:sapdos_api_integration_assignment/presentation/bloc/register/register_user_state.dart';
import 'package:sapdos_api_integration_assignment/data/models/register_request_model.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_button.dart';
import 'package:sapdos_api_integration_assignment/presentation/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign-Up')),
      body: BlocListener<RegisterUserBloc, RegisterUserState>(
        listener: (context, state) {
          if (state is RegisterUserSuccess) {
            Navigator.pushNamed(context, '/login');
          } else if (state is RegisterUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign-Up Failed: ${state.error}')),
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
                controller: phoneController,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              CustomButton(
                text: 'Sign-Up',
                onPressed: () {
                  final registerRequest = RegisterRequestModel(
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    password: passwordController.text,
                  );
                  BlocProvider.of<RegisterUserBloc>(context).add(
                    RegisterButtonPressed(registerRequest: registerRequest),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Sign-In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
