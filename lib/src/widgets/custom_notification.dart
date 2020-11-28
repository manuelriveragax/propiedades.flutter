part of 'widgets.dart';

customNotification(String title) {
  return BotToast.showSimpleNotification(
    title: title,
    titleStyle: TextStyle(color: secondaryColor),
    backgroundColor: primaryColor,
  );
}

customNotificationVerificando(String title) {
  return BotToast.showSimpleNotification(
    title: title,
    titleStyle: TextStyle(color: secondaryColor),
    backgroundColor: primaryColor,
    duration: Duration(seconds: 10),
  );
}
