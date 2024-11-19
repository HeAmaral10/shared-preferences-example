import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import 'login_page.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  //Tela inicial que verifica o estado de login
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Estado da SplashScreen

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); //Verifica o status de login ao iniciar
  }

  Future<void> _checkLoginStatus() async {
    bool isLoggedIn =
      await SharedPrefs.getLoginStatus();
    if (isLoggedIn) {
      //Se estiver logado, navega para a HomePage
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      //Se não estiver logado, navega para a LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Exibe uma tela de carregamento enquanto verifica o login
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}