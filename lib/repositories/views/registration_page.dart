import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/services/database.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.white), // Цвет текста в форме
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.white), // Цвет текста метки
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма неактивна
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма активна
              ),
              fillColor: const Color.fromARGB(255, 0, 0, 0), // Цвет фона формы
              filled: true, // Установите true, чтобы заливка фона работала
            ),

            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your username';
              }
              return null;
            },
            onSaved: (value) {
              _username = value!;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: Colors.white), // Цвет текста в форме
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white), // Цвет текста метки
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма неактивна
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма активна
              ),
              fillColor: const Color.fromARGB(255, 0, 0, 0), // Цвет фона формы
              filled: true, // Установите true, чтобы заливка фона работала
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.white), // Цвет текста в форме
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white), // Цвет текста метки
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма неактивна
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Цвет границы, когда форма активна
              ),
              fillColor: const Color.fromARGB(255, 0, 0, 0), // Цвет фона формы
              filled: true, // Установите true, чтобы заливка фона работала
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Здесь вы можете отправить данные регистрации на сервер или выполнить другие действия
                print('Username: $_username');
                print('Email: $_email');
                print('Password: $_password');
                registerUser(_email, _username, _password);
              }
              Navigator.of(context).pushNamed('/page2');
            },
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white),
              ),
            
          ),
        ],
      ),
    );
  }
}