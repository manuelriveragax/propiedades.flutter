part of 'widgets.dart';

Widget customTextCard(String labelText, String placeholder) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
    child: TextField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        labelStyle: midText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: smallText,
      ),
    ),
  );
}
