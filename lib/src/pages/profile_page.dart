part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _prefs = new UserPreferences();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: SizedBox()),
              CustomCircleAvatar(icon: FontAwesomeIcons.camera),
              Expanded(flex: 1, child: SizedBox()),
              Container(
                decoration: BoxDecoration(
                  color: altColor,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    customTextCard('Correo Electrónico', _prefs.username),
                    customTextCard('Token', _prefs.bearerToken),
                    customTextCard('Tipo de Membresia', 'Diamante'),
                    customTextCard('Numero de propiedades', '12'),
                    customTextCard('Algo mas 3', 'Info 3'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
