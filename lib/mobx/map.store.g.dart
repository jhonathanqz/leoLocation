// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on MapBase, Store {
  final _$isLoadingAtom = Atom(name: 'MapBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$latDeviceAtom = Atom(name: 'MapBase.latDevice');

  @override
  double get latDevice {
    _$latDeviceAtom.reportRead();
    return super.latDevice;
  }

  @override
  set latDevice(double value) {
    _$latDeviceAtom.reportWrite(value, super.latDevice, () {
      super.latDevice = value;
    });
  }

  final _$lngDeviceAtom = Atom(name: 'MapBase.lngDevice');

  @override
  double get lngDevice {
    _$lngDeviceAtom.reportRead();
    return super.lngDevice;
  }

  @override
  set lngDevice(double value) {
    _$lngDeviceAtom.reportWrite(value, super.lngDevice, () {
      super.lngDevice = value;
    });
  }

  final _$addressUserAtom = Atom(name: 'MapBase.addressUser');

  @override
  String get addressUser {
    _$addressUserAtom.reportRead();
    return super.addressUser;
  }

  @override
  set addressUser(String value) {
    _$addressUserAtom.reportWrite(value, super.addressUser, () {
      super.addressUser = value;
    });
  }

  final _$cityUserAtom = Atom(name: 'MapBase.cityUser');

  @override
  String get cityUser {
    _$cityUserAtom.reportRead();
    return super.cityUser;
  }

  @override
  set cityUser(String value) {
    _$cityUserAtom.reportWrite(value, super.cityUser, () {
      super.cityUser = value;
    });
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('MapBase.getCurrentLocation');

  @override
  Future<dynamic> getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  final _$getAddressUserAsyncAction = AsyncAction('MapBase.getAddressUser');

  @override
  Future<dynamic> getAddressUser() {
    return _$getAddressUserAsyncAction.run(() => super.getAddressUser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
latDevice: ${latDevice},
lngDevice: ${lngDevice},
addressUser: ${addressUser},
cityUser: ${cityUser}
    ''';
  }
}
