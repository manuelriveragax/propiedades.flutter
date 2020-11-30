part of 'widgets.dart';

class LargeButton extends StatelessWidget {
  @required
  final String text;
  final Function onPress;

  const LargeButton({
    this.text,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: this.onPress,
        color: primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
          child: Text(
            this.text,
            style: buttonText,
          ),
        ),
      ),
    );
  }
}
