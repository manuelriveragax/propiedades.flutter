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
    final height = MediaQuery.of(context).size.height;
    final Duration duration = Duration(milliseconds: 1000);
    final _prefs = new UserPreferences();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Logo(),
                Text(_prefs.username, style: smallText),
                SizedBox(height: 25),
                _EmailField(emailController: emailController, duration: duration),
                SizedBox(height: 25),
                _passwordField(duration),
                SizedBox(height: 25),
                _LoginButton(
                    duration: duration,
                    emailController: emailController,
                    passwordController: passwordController),
                _ForgotPasswordButton(duration: duration),
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomFormField _passwordField(Duration duration) {
    return CustomFormField(
      animate: true,
      hintText: 'Contraseña',
      textController: passwordController,
      duration: duration,
      obscureText: _obscureText,
      icon: FontAwesomeIcons.lock,
      suffixIcon: IconButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
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
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key key,
    @required this.duration,
  }) : super(key: key);

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: duration * 3,
      child: FlatButton(
        onPressed: () {},
        child: Text("¿Olvidaste tu Contraseña?", style: smallText),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key key,
    @required this.duration,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final Duration duration;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: duration,
      from: 250,
      child: LargeButton(
        text: 'Log In',
        onPress: () async {
          validateLogin(context, emailController.text.trim(), passwordController.text.trim());
        },
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    Key key,
    @required this.emailController,
    @required this.duration,
  }) : super(key: key);

  final TextEditingController emailController;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
        icon: FontAwesomeIcons.envelope,
        obscureText: false,
        animate: true,
        textController: emailController,
        duration: duration,
        hintText: 'Correo Electrónico');
  }
}
