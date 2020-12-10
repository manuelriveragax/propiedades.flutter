part of 'pages.dart';

class HomePage extends StatefulHookWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: CustomCarousel(index),
            ),
          ),
          Expanded(
            flex: 3,
            child: HomeMenuButtons(),
          ),
        ],
      ),
    );
  }
}
