import 'package:flutter/material.dart';
import 'package:flutter_internship/colors.dart';
import 'package:flutter_internship/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HARMONIX',
      theme: ThemeData(
        primaryColor: mprimary,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,

      ),

      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: AssetImage('assets/images/harmonix.logonew.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  // TODO: Handle login logic
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Create an Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  bool _isValid = false;
  bool _showEmptyError = false;

  void _validateForm() {
    setState(() {
      _isValid = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _nameController.text.isNotEmpty &&
          _birthdateController.text.isNotEmpty;
    });
  }

  void _register() {
    if (_isValid) {
      // TODO: Handle registration logic
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      setState(() {
        _showEmptyError = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/harmonix.logonew.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                  onChanged: (_) => _validateForm(),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                    labelText: 'Birthdate',
                  ),
                  onChanged: (_) => _validateForm(),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (_) => _validateForm(),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (_) => _validateForm(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _register,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              _showEmptyError
                  ? Text(
                'Please fill out all the fields.',
                style: TextStyle(color: Colors.red),
              )
                  : SizedBox(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Already have an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
