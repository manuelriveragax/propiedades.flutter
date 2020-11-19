part of 'widgets.dart';

class LargeButton extends StatelessWidget {
  @required
  final String text;
  final double height;
  final Function onPress;

  const LargeButton({
    this.text,
    this.height = 50.0,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: width * 0.80,
      height: this.height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: this.onPress,
        color: primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
          child: Text(
            this.text,
            style: buttonText,
          ),
        ),
      ),
    );
  }
}
