part of 'widgets.dart';

class HomeMenuButtons extends StatelessWidget {
  const HomeMenuButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Table(
          children: [
            TableRow(
              children: [
                CustomMenuButton(
                  title: 'Venta Membresias',
                  routeName: 'membresias',
                  color: Colors.black,
                  icon: Icons.card_giftcard,
                ),
                CustomMenuButton(
                  title: 'Venta Servicios',
                  routeName: 'servicios',
                  color: Colors.black,
                  icon: Icons.cleaning_services,
                ),
              ],
            ),
            TableRow(
              children: [
                CustomMenuButton(
                  title: 'Venta Articulos',
                  routeName: 'articulos',
                  color: Colors.black,
                  icon: Icons.store,
                ),
                CustomMenuButton(
                  title: 'Agenda Servicio',
                  routeName: 'agenda',
                  color: Colors.black,
                  icon: Icons.calendar_today,
                ),
              ],
            ),
            TableRow(
              children: [
                CustomMenuButton(
                  title: 'Propiedades',
                  routeName: 'propiedades',
                  color: Colors.black,
                  icon: Icons.home,
                ),
                CustomMenuButton(
                  title: 'Carrito de Compras',
                  routeName: 'carrito',
                  color: Colors.black,
                  icon: Icons.shopping_cart,
                ),
              ],
            ),
            TableRow(
              children: [
                CustomMenuButton(
                  title: 'Mensajes',
                  routeName: 'mensajes',
                  color: Colors.black,
                  icon: Icons.message,
                ),
                CustomMenuButton(
                  title: 'Perfil',
                  routeName: 'profile',
                  color: Colors.black,
                  icon: FontAwesomeIcons.userAlt,
                ),
              ],
            ),
            TableRow(
              children: [
                CustomMenuButton(
                  title: 'Configuracion',
                  color: Colors.black,
                  icon: Icons.settings,
                ),
                CustomMenuButton(
                  color: Colors.black,
                  title: 'Cerrar Sesion',
                  icon: FontAwesomeIcons.doorOpen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
