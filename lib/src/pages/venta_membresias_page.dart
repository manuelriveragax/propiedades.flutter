part of 'pages.dart';

class VentaMembresiasPage extends StatelessWidget {
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Membresias'),
      ),
      body: Container(
        child: PageView(
          controller: _pageController,
          children: [
            MembresiaCard(borderColor: Color.fromRGBO(176, 141, 87, 1.0)),
            MembresiaCard(borderColor: Colors.grey),
            MembresiaCard(borderColor: Color.fromRGBO(255, 194, 0, 1.0)),
            MembresiaCard(borderColor: Colors.blueGrey.shade500),
          ],
        ),
      ),
    );
  }
}

class MembresiaCard extends StatelessWidget {
  final Color borderColor;

  const MembresiaCard({Key key, this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0, bottom: 40.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 5.0),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Text('titulo de la tarjeta'),
          Spacer(),
          Text('Subtitulo de la tarjeta'),
          Spacer(),
          Text('Informacion de la membresia'),
          Spacer(),
          Text('Precio de la membresia'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LargeButton(text: 'Comprar', onPress: () {}),
          ),
        ],
      ),
    );
  }
}
