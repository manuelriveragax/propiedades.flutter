part of 'widgets.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData icon;
  const CustomCircleAvatar({
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
        ),
        Positioned(
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
            child: IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              color: primaryColor,
              icon: FaIcon(icon, size: smallIcon),
              onPressed: () {
                customNotification('Se presiono el boton de camara');
              },
            ),
          ),
        )
      ],
    );
  }
}
