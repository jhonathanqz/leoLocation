import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'map.store.g.dart';

class MapStore = MapBase with _$MapStore;

abstract class MapBase with Store {
  @observable
  bool isLoading = false;

  @observable
  double latDevice;

  @observable
  double lngDevice;

  @observable
  String addressUser = '';

  @observable
  String cityUser = '';

  @action
  Future<dynamic> getCurrentLocation() async {
    isLoading = true;
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final latitude = "${position.latitude}";
    final longitude = "${position.longitude}";
    latDevice = double.tryParse(latitude);
    lngDevice = double.tryParse(longitude);
    isLoading = false;

    await getAddressUser();
  }

  @action
  Future<dynamic> getAddressUser() async {
    isLoading = true;
    final coordinates = Coordinates(latDevice, lngDevice);

    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    cityUser = '${address.first.subAdminArea} - ${address.first.adminArea}';
    addressUser = address.first.addressLine;
    print('endereco capturado: $addressUser');
    print('cityUser = $cityUser');
    isLoading = false;
  }
}
