import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Tela principal do aplicativo

  Future<void> _logout(BuildContext context) async {
    await SharedPrefs.removeLoginStatus(); //Remove o estado de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Constrói a interface da tela principal
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            ),
        ],
      ),
      body: const Center(
        child: Text(
          'Bem-vindo!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}