import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:propiedades/src/shared_preferences/shared_preferences.dart';
import 'package:propiedades/src/themes/styles.dart';
import 'package:propiedades/src/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _prefs = new UserPreferences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Stack(
                overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
                  ),
                  IconAvatar(),
                ],
              ),
              SizedBox(height: 40),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 250,
                  minHeight: 375,
                  maxWidth: 300,
                  maxHeight: 500,
                ),
                child: Container(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customTextCard('Correo Electrónico', _prefs.username),
                      customTextCard('Token', _prefs.bearerToken),
                      customTextCard('Algo mas 1', 'Info 1'),
                      customTextCard('Algo mas 2', 'Info 2'),
                      customTextCard('Algo mas 3', 'Info 3'),
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconAvatar extends StatelessWidget {
  const IconAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 70,
      child: Container(
        alignment: Alignment.center,
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 2.0),
          color: secondaryColor,
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          FontAwesomeIcons.camera,
          color: primaryColor,
          size: smallIcon,
        ),
      ),
    );
  }
}
