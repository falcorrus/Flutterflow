import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _emailCoach = prefs.getString('ff_emailCoach') ?? _emailCoach;
  }

  SharedPreferences prefs;

  bool showFullList = true;

  int currentPrice = 0;

  DateTime todayNow;

  String DayToday = '';

  String _emailCoach = '';
  String get emailCoach => _emailCoach;
  set emailCoach(String _value) {
    _emailCoach = _value;
    prefs.setString('ff_emailCoach', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
