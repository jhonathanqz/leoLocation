import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_leo/app/injection_container.dart';
import 'package:location_leo/mobx/map.store.dart';
import 'package:location_leo/widgets/card_location_image.dart';
import 'package:location_leo/widgets/scaffold/scaffold_primary.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapStore = sl<MapStore>();

  GoogleMapController mapController;

  Set<Marker> markers = Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    
    mapStore.getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final locationinfo = '${mapStore.latDevice}, ${mapStore.lngDevice}';
      return ScaffoldPrimary(
        isLoading: mapStore.isLoading,
        titleWidget: Text(locationinfo),
        isAction: true,
        widgetAction: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
              icon: Icon(
                Icons.location_on,
                size: 30,
              ),
              onPressed: () async {
                grantPermissions(function: () async {
                  await mapStore.getCurrentLocation();
                  getLocationMarker(
                    mapStore: mapStore,
                    markerId: 'device_location',
                    titleMarker: '${mapStore.addressUser}',
                  );
                  setState(() {});
                });
              }),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                onCameraMove: (data) {
                  print(data);
                },
                onTap: (position) {
                  print(position);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    mapStore.latDevice,
                    mapStore.lngDevice,
                  ),
                  zoom: 11,
                ),
                markers: markers,
              ),
            ),
            cardLocation(
              context: context,
              mapStore: mapStore,
            ),
          ],
        ),
      );
    });
  }

  void getLocationMarker({
    @required MapStore mapStore,
    @required String markerId,
    @required String titleMarker,
  }) {
    mapStore.getAddressUser();
    mapStore.isLoading = true;
    LatLng position = LatLng(
      mapStore.latDevice,
      mapStore.lngDevice,
    );
    mapController.moveCamera(CameraUpdate.newLatLng(position));

    final Marker marker = Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(
          title: titleMarker, //'${mapStore.latDevice}, ${mapStore.lngDevice}',
          snippet: '${mapStore.cityUser}',
        ));

    setState(() {
      markers.add(marker);
    });
    mapStore.isLoading = false;
  }

  Widget cardLocation({
    @required BuildContext context,
    @required MapStore mapStore,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CardLocationImage(
            urlImage:
                'https://grandesnomesdapropaganda.com.br/wp-content/uploads/2019/07/Colorado.jpg',
            onTap: () async {
              grantPermissions(function: () async {
                mapStore.isLoading = true;
                mapStore.latDevice = -21.1990683;
                mapStore.lngDevice = -47.7572259;
                await mapStore.getAddressUser();
                getLocationMarker(
                  mapStore: mapStore,
                  markerId: 'toca_do_urso',
                  titleMarker: 'Toca do Urso',
                );
                setState(() {});
                mapStore.isLoading = false;
              });
            },
          ),
          CardLocationImage(
            urlImage: 'https://i.ytimg.com/vi/UnlmNxvejNE/maxresdefault.jpg',
            onTap: () async {
              grantPermissions(function: () async {
                mapStore.isLoading = true;
                mapStore.latDevice = -21.2613276;
                mapStore.lngDevice = -48.4986871;
                await mapStore.getAddressUser();
                getLocationMarker(
                  mapStore: mapStore,
                  markerId: 'santo_onofre',
                  titleMarker: 'Armazém Santo Onofre',
                );
                setState(() {});
                mapStore.isLoading = false;
              });
            },
          ),
          CardLocationImage(
            urlImage:
                'https://static-images.ifood.com.br/image/upload/t_high/logosgde/fd8ba2a8-1dff-4fe5-9e68-5b186921bae9/202004282032_rud8_i.png',
            onTap: () async {
              grantPermissions(function: () async {
                mapStore.isLoading = true;
                mapStore.latDevice = -21.2593434;
                mapStore.lngDevice = -48.3175547;
                await mapStore.getAddressUser();
                getLocationMarker(
                  mapStore: mapStore,
                  markerId: 'senhor_buteco',
                  titleMarker: 'Senhor Buteco',
                );
                setState(() {});
                mapStore.isLoading = false;
              });
            },
          ),
          CardLocationImage(
            urlImage:
                'https://www.economiasc.com/wp-content/uploads/2020/01/hard-rock-cafe-1-1-1030x682-1.jpg',
            onTap: () async {
              grantPermissions(function: () async {
                mapStore.isLoading = true;
                mapStore.latDevice = -21.2019206;
                mapStore.lngDevice = -47.789342;
                await mapStore.getAddressUser();
                getLocationMarker(
                  mapStore: mapStore,
                  markerId: 'hard_rock',
                  titleMarker: 'Hard Rock Café',
                );
                setState(() {});
                mapStore.isLoading = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> grantPermissions({@required Function() function}) async {
    if (await Permission.location.isUndetermined ||
        await Permission.location.isDenied ||
        await Permission.locationAlways.isUndetermined ||
        await Permission.locationAlways.isDenied) {
      await Permission.location.request();
      await Permission.locationAlways.request();
      return;
    }
    function();
  }
}
