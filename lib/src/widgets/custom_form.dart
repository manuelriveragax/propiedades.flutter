part of 'widgets.dart';

class CustomForm extends StatefulWidget {
  final double width;
  final double height;
  final String hintText;
  final Icon icon;
  final GestureDetector suffixIcon;
  final bool obscureText;

  CustomForm({
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              style: midText,
              obscureText: widget.obscureText,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: widget.icon,
                hintText: widget.hintText,
                border: InputBorder.none,
                suffixIcon: widget.suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
