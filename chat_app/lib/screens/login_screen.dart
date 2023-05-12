import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isSignIn = true;
  final _form = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void _submit() async {
    final isValidate = _form.currentState!.validate();
    if (isValidate) {
      _form.currentState!.save();

      try {
        if (_isSignIn) {
          final userCredentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
        } else {
          final userCredentials = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
        }
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Authentication failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: 200,
                height: 200,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/chat.png'),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter valid email.';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _email = newValue!,
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must at least 6 characters long.';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _password = newValue!,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            child:
                                Text(_isSignIn ? 'Sign In' : 'Create Account'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isSignIn = !_isSignIn;
                              });
                            },
                            child: Text(_isSignIn
                                ? 'Already have an account? Sign in now.'
                                : 'Don\'t have an account? Create one.'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
