part of 'widgets.dart';

class CustomMenuButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String routeName;

  const CustomMenuButton({this.color, this.icon, this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          height: 100.0,
          margin: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0, top: 5.0),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(20.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: Icon(
                    icon,
                    color: primaryColor,
                    size: 40.0,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(title,
                      style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none))),
            ],
          ),
        ),
      ),
    );
  }
}
