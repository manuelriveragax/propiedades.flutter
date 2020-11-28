part of 'helpers.dart';

validateLogin(BuildContext context, String email, String password) async {
  if (validateEmail(email)) {
    customNotificationVerificando('Verificando Credenciales');
    final res = await context.read(userProvider).loginAttempt(email, password);
    BotToast.cleanAll();

    if (res != null) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => NavigationPage()));
    } else if (res == null) {
      return customNotification('Usuario o Contraseña incorrectos');
    }
  } else if (email.isEmpty || password.isEmpty) {
    return customNotification('Los campos son obligatorios');
  } else if (!validateEmail(email)) {
    return customNotification('Ingrese un correo válido');
  }
}
