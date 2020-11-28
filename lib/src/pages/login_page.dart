part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final Duration duration = Duration(milliseconds: 1000);
    final _prefs = new UserPreferences();

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: secondaryColor,
        child: Column(
          children: [
            SafeArea(
              child: FadeIn(
                duration: duration,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Logo(),
                    Positioned(
                      top: height * 0.20,
                      child: Text(_prefs.username, style: smallText),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        icon: FontAwesomeIcons.envelope,
                        obscureText: false,
                        animate: true,
                        textController: emailController,
                        duration: duration,
                        hintText: 'Correo Electrónico'),
                    SizedBox(height: 25),
                    CustomFormField(
                      animate: true,
                      hintText: 'Contraseña',
                      textController: passwordController,
                      duration: duration,
                      obscureText: _obscureText,
                      icon: FontAwesomeIcons.lock,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                          size: smallIcon,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    FadeIn(
                      duration: duration * 3,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text("¿Olvidaste tu Contraseña?", style: smallText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            FadeInLeft(
              duration: duration,
              from: 250,
              child: LargeButton(
                height: 46,
                text: 'Log In',
                onPress: () async {
                  validateLogin(context, emailController.text.trim(), passwordController.text.trim());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
