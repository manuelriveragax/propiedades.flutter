part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final Duration duration = new Duration(milliseconds: 1000);

    return Scaffold(
        body: Container(
      width: width,
      height: height,
      color: secondaryColor,
      child: Column(
        children: [
          SafeArea(
            child: Logo(),
          ),
          FadeInLeft(
            duration: duration,
            from: 250,
            child: CustomForm(
              width: width * 0.80,
              height: 50,
              hintText: 'Correo Electrónico',
              icon: Icon(FontAwesomeIcons.envelope, color: primaryColor, size: midIcon),
            ),
          ),
          SizedBox(height: 30.0),
          FadeInLeft(
            duration: duration,
            from: 250,
            child: CustomForm(
              obscureText: _obscureText,
              width: width * 0.80,
              height: 50,
              hintText: 'Contraseña',
              icon: Icon(FontAwesomeIcons.lock, color: primaryColor, size: midIcon),
              suffixIcon: GestureDetector(
                onTap: _toggleText,
                child: Icon(
                  _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  size: smallIcon,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          FadeIn(
            duration: duration,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "¿Olvidaste tu Contraseña?",
                style: smallText,
              ),
            ),
          ),
          Spacer(),
          FadeInLeft(
            duration: duration,
            from: 250,
            child: LargeButton(
              height: 50,
              onPress: () {
                getAuthToken();
                Navigator.push(context, CupertinoPageRoute(builder: (context) => NavigationPage()));
              },
              // onPress: () {
              //   Navigator.push(context, CupertinoPageRoute(builder: (context) => NavigationPage()));
              // },
              text: 'Log In',
            ),
          ),
        ],
      ),
    ));
  }

  void _toggleText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
