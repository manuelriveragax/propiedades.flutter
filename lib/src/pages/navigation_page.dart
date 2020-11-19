part of 'pages.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  PageController _pageController = PageController(
    initialPage: 1,
  );

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: currentIndex,
          height: 55,
          color: primaryColor,
          backgroundColor: secondaryColor,
          buttonBackgroundColor: primaryColor,
          animationDuration: Duration(milliseconds: 250),
          animationCurve: Curves.fastOutSlowIn,
          items: [
            FaIcon(FontAwesomeIcons.user, size: 22, color: secondaryColor),
            FaIcon(FontAwesomeIcons.home, size: 22, color: secondaryColor),
            FaIcon(FontAwesomeIcons.directions, size: 22, color: secondaryColor),
          ],
          onTap: (value) {
            currentIndex = value;
            _pageController.animateToPage(
              value,
              duration: Duration(milliseconds: 250),
              curve: Curves.fastOutSlowIn,
            );
            setState(() {});
          },
        ),
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              currentIndex = page;
            });
          },
          children: [
            ProfilePage(),
            HomePage(),
            MapaPage(),
          ],
        ));
  }
}
