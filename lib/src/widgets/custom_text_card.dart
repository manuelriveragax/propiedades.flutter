part of 'widgets.dart';

Widget customTextCard(String labelText, String placeholder) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
    child: TextField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        labelStyle: midText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: smallText,
      ),
    ),
  );
}
