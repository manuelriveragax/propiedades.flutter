import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hooks_riverpod/all.dart';

import 'package:propiedades/src/models/login_model.dart';
import 'package:propiedades/src/state/state_manager.dart';
import 'package:propiedades/src/themes/styles.dart';
import 'package:propiedades/src/widgets/widgets.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    AsyncValue<LoginModel> user = watch(userStateFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text('test usando api y riverpod'),
      ),
      body: user.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('${error.toString()}')),
        data: (data) {
          return SafeArea(
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
                          customTextCard('Token Type', data.tokenType),
                          customTextCard('Correo Electrónico', data.userName),
                          customTextCard('Issued', data.issued),
                          customTextCard('Expires', data.expires),
                          customTextCard('Expires In', data.expiresIn.toString()),
                          SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
