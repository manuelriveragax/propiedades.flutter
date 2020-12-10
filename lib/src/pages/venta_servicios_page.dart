part of 'pages.dart';

class VentaServiciosPage extends StatelessWidget {
  final _controller = new PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Venta de Servicios'),
      ),
      body: Container(
        child: ListView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          children: [
            ServicioCard(
              tituloServicio: 'Mantenimiento de Aire Acondicionado',
              precio: '299.99',
              icono: Icons.ac_unit,
            ),
            ServicioCard(
              tituloServicio: 'Mantenimiento de Cisterna',
              precio: '259.99',
              icono: Icons.water_damage,
            ),
            ServicioCard(
              tituloServicio: 'Instalacion electrica',
              precio: '199.99',
              icono: Icons.electrical_services,
            ),
            ServicioCard(
              tituloServicio: 'Servicio de Pintura',
              precio: '599.99',
              icono: Icons.brush,
            ),
            ServicioCard(
              tituloServicio: 'Limpieza General',
              precio: '399.99',
              icono: Icons.cleaning_services,
            ),
            ServicioCard(
              tituloServicio: 'Reparacion de equipo',
              precio: '899.99',
              icono: Icons.home_repair_service,
            ),
          ],
        ),
      ),
    );
  }
}

class ServicioCard extends StatelessWidget {
  final String tituloServicio;
  final IconData icono;
  final String precio;

  const ServicioCard({Key key, this.tituloServicio, this.icono, this.precio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icono, size: 35),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tituloServicio),
              Text('\$$precio'),
            ],
          ),
          IconButton(icon: FaIcon(FontAwesomeIcons.shoppingCart, size: 25), onPressed: () {})
        ],
      ),
    );
  }
}
