part of 'widgets.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
    this.obscureText,
    this.onPressed,
    this.icon,
    this.suffixIcon,
    @required this.animate,
    @required this.textController,
    @required this.duration,
    @required this.hintText,
  }) : super(key: key);

  final bool obscureText;
  final Function onPressed;
  final IconData icon;
  final IconButton suffixIcon;
  final bool animate;
  final TextEditingController textController;
  final Duration duration;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return FadeInLeft(
      animate: animate,
      from: 250,
      duration: duration,
      child: Container(
        width: width * 0.80,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          style: smallText,
          obscureText: obscureText,
          controller: textController,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            icon: Icon(icon, color: primaryColor, size: midIcon),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
