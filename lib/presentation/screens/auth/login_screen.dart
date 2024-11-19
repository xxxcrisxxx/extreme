import 'package:extreme_work_outs/presentation/screens/webpageScreen.dart';
import 'package:flutter/material.dart';
import 'package:extreme_work_outs/presentation/widgets/common/custom_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:extreme_work_outs/theme/app_colors.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      print("Login successful");
      /* final isAuthenticated = await authenticateUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    } */
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return WillPopScope(
      onWillPop: () async {
        if (!isUserLoggedIn()) {
          SystemNavigator.pop();
          return false; 
        }
        return true; 
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80),
              Image.asset(
                'lib/assets/images/default/logo-1.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Email',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.secondaryColor, width: 2),
                        ),
                      ),
                      cursorColor: AppColors.primaryColor,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your email'
                          : null,
                    ),
                    SizedBox(height: 16),
                    Text('Password',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText:
                          _obscureText, // Controla si se oculta o muestra la contraseña
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.secondaryColor, width: 2),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility, // Cambiar icono
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Alternar visibilidad
                            });
                          },
                        ),
                      ),
                      cursorColor: AppColors.primaryColor,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your password'
                          : null,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      label: 'Login',
                      onPressed: _login,
                    ),
                    // Enlaces de Registrarse y Lost Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebPage(
                                  url: 'https://extremeworkouts.net/register/',
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebPage(
                                  url:
                                      'https://extremeworkouts.net/lost-password',
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Lost Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          "© $currentYear Extreme Workouts, All Rights Reserved.",
                          style: TextStyle(color: AppColors.textWhite),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  bool isUserLoggedIn() {
    // Aquí debería estar la lógica para verificar si el usuario está logueado
    // Retorna true si la sesión está activa o false si no lo está
    return false; // Ejemplo: retorna false para forzar siempre el login
  }
}
