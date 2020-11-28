part of 'pages.dart';

class MapaPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String alias;

  const MapaPage({Key key, this.latitude, this.longitude, this.alias}) : super(key: key);

  @override
  State<MapaPage> createState() => MapaPageState();
}

class MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.5,
    );

    Set<Marker> marker = new Set<Marker>();
    marker.add(new Marker(
      markerId: MarkerId('marcador'),
      position: LatLng(widget.latitude, widget.longitude),
    ));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.alias),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () async {
              _centerLocation();
            },
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: marker,
      ),
    );
  }

  Future<void> _centerLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(widget.latitude, widget.longitude), zoom: 14.5),
      ),
    );
  }
}
