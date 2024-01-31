// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:dr_fut_app/screens/auth/verification.dart';
import 'package:dr_fut_app/services/amplify_auth_service.dart';
import 'package:flutter/material.dart';

class CadastroForm extends StatefulWidget {
  const CadastroForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final amplifyAuthService = AmplifyAuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Telefone'),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
  onPressed: () async {
  try {
    await amplifyAuthService.signUpWithPhoneVerification(
      _phoneController.text,
      _passwordController.text,
      _emailController.text
    ).then((result) {
      debugPrint('entrou no try - $result');
      // Se a execução chegou aqui, o cadastro foi bem-sucedido
      if(result == 'User already exists'){
        // Exibir um SnackBar indicando que o usuário já existe
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Center(
             child: Text('Usuário já existe.'),
            ),
            duration: const Duration(milliseconds: 1500),
            width: 180.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => verificationCodeSignUp(),
          ),
        );
      }

    });
  } catch (e) {
    debugPrint('entrou no catch');
    if (e == 'User already exists') {
      // Se a exceção for do tipo UsernameExistsException, imprima a mensagem específica
      debugPrint('USUARIO JA EXISTE');
    } else {
      // Se a exceção não for do tipo esperado, imprima a representação padrão da exceção
      debugPrint('Erro no login cadastroForm service: $e');
    }
  }
},
  child: const Text('Cadastrar'),
),
        ],
      ),
    );
  }
}
