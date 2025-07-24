import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (error != null) Text(error!, style: TextStyle(color: Colors.red)),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) =>
                val!.isEmpty ? 'Enter your email' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) =>
                val!.isEmpty ? 'Enter your password' : null,
              ),
              SizedBox(height: 16),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                child: Text('Login'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await Provider.of<AuthProvider>(context, listen: false)
                          .login(emailController.text, passwordController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    } catch (e) {
                      setState(() {
                        error = e.toString();
                        isLoading = false;
                      });
                    }
                  }
                },
              ),
              TextButton(
                child: Text("No account? Register"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
