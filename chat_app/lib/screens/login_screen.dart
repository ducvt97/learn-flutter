import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final firebaseAuth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isSignIn = true;
  var _isLoading = false;
  final _form = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _username;
  File? _image;

  void _submit() async {
    setState(() {
      _isLoading = true;
    });

    final isValidate = _form.currentState!.validate();
    if (!isValidate || !_isSignIn && _image == null) {
      return;
    }

    _form.currentState!.save();

    try {
      if (_isSignIn) {
        final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } else {
        final userCredentials =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child('${userCredentials.user!.uid}.jpg');
        await storageRef.putFile(_image!);
        final imageUrl = await storageRef.getDownloadURL();

        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set(
          {
            'email': _email,
            'username': _username,
            'image_url': imageUrl,
          },
        );
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  void pickImage(File? image) => _image = image;

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
                        if (!_isSignIn) UserImagePicker(onPickImage: pickImage),
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
                        if (!_isSignIn)
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username',
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter valid email.';
                              }
                              return null;
                            },
                            onSaved: (newValue) => _username = newValue!,
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
                        _isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _submit,
                                  child: Text(
                                      _isSignIn ? 'Sign In' : 'Create Account'),
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
