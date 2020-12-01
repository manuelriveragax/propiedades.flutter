part of 'pages.dart';

class MapaPage extends StatefulHookWidget {
  @override
  _NewMapPageState createState() => _NewMapPageState();
}

class _NewMapPageState extends State<MapaPage> with AutomaticKeepAliveClientMixin {
  List<Marker> allMarkers = [];

  GoogleMapController _mapController;
  PageController _pageController;
  int prevPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)..addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final despachoResponse = useProvider(futureDespachoProvider);

    return despachoResponse.when(
      error: (e, s) => Text('Error: $e'),
      loading: () => Center(child: CircularProgressIndicator(backgroundColor: primaryColor)),
      data: (despacho) {
        despacho.propiedades.forEach((propiedad) {
          allMarkers.add(
            Marker(
              markerId: MarkerId(propiedad.clienteId.toString()),
              draggable: false,
              position: LatLng(propiedad.latitud, propiedad.longitud),
              infoWindow: InfoWindow(
                title: propiedad.alias,
                snippet: propiedad.colonia,
              ),
            ),
          );
        });

        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  child: GoogleMap(
                    padding: EdgeInsets.only(bottom: 200, top: 0, right: 0, left: 0),
                    zoomControlsEnabled: true,
                    compassEnabled: false,
                    mapToolbarEnabled: true,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    markers: Set.from(allMarkers),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(despacho.propiedades[0].latitud, despacho.propiedades[0].longitud),
                      zoom: 20.0,
                      bearing: 45.0,
                      tilt: 45.0,
                    ),
                    onMapCreated: _onMapCreated,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    height: height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: despacho.propiedades.length,
                      itemBuilder: (_, index) {
                        return PropiedadesMapList(index, _pageController);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onMapCreated(controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void moveCamera() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: allMarkers[_pageController.page.toInt()].position,
          zoom: 20.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }

  // Future<void> _centerLocation() async {
  //   await _mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: allMarkers[_pageController.page.toInt()].position, zoom: 14.5),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}
