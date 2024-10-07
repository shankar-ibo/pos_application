import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:kpn_pos_application/blocs/login_bloc.dart';
import 'package:kpn_pos_application/vm/login_vm.dart';

class LoginPage extends StatelessWidget {
  final LoginViewModel loginViewModel;

  const LoginPage({required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (_) => LoginBloc(), // Ensure that LoginBloc is created here
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Navigate to home page on success
              Get.offAndToNamed('/home');
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Dispatch the event when button is clicked
                        context
                            .read<LoginBloc>()
                            .add(LoginButtonPressed('admin', '123'));
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
