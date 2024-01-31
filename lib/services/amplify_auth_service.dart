// ignore: depend_on_referenced_packages
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyAuthService {
  /// Signs a user up with a username, password, and email. The required
  /// attributes may be different depending on your app's configuration.
    Future<String> signUpWithPhoneVerification(name, password, email) async {
    try {
            // Converta o email para um mapa de atributos de usuário
      Map<AuthUserAttributeKey, String> userAttributes = {
        AuthUserAttributeKey.email: email,
      };

      await Amplify.Auth.signUp(
        username: name,
        password: password,
        options: SignUpOptions(userAttributes: userAttributes),
      );
      return ('login realizado');

    } on AuthException catch (e) {
      return e.message;
    }
  }
}
