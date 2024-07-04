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
  final TextEditingController confirmPasswordController = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Sapdos',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF13235A), // Set text color to 13235A
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF13235A), // Set text color to 13235A
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Enter new account’s details',
                            style: TextStyle(
                              fontSize: 20,
                            //  color: Colors.grey,
                              color: Color(0xFF13235A), // Set text color to 13235A
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email, color: Color(0xFF13235A)), // Set icon color to 13235A
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icon(Icons.phone, color: Color(0xFF13235A)), // Set icon color to 13235A
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF13235A)), // Set icon color to 13235A
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF13235A)), // Set icon color to 13235A
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Sign-Up',
                      onPressed: () {
                        final registerRequest = RegisterRequestModel(
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                          password: passwordController.text,
                        );
                        if (passwordController.text == confirmPasswordController.text) {
                          BlocProvider.of<RegisterUserBloc>(context).add(
                            RegisterButtonPressed(registerRequest: registerRequest),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Passwords do not match')),
                          );
                        }
                      },
                      width: double.infinity, // Set button width to fill the container
                      color: Color(0xFF13235A), // Set button background color to 13235A
                      textColor: Colors.white, // Set text color to white
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already on Sapdos?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text('Sign-In', style: TextStyle(color: Color(0xFF13235A))), // Set text color to 13235A
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
