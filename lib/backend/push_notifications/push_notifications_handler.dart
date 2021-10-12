import 'dart:async';
import 'dart:convert';

import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../register/register_widget.dart';
import '../../cart/cart_widget.dart';
import '../../list_page/list_page_widget.dart';
import '../../profile_page/profile_page_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/myway_eu2-01.png',
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Register': (data) async => RegisterWidget(),
  'Cart': (data) async => CartWidget(),
  'ListPage': (data) async => hasMatchingParameters(data, {'who'})
      ? ListPageWidget(
          who: getParameter(data, 'who'),
        )
      : NavBarPage(initialPage: 'ListPageWidget'),
  'Login2': (data) async => NavBarPage(initialPage: 'Login2Widget'),
  'profilePage': (data) async => hasMatchingParameters(data, {'who'})
      ? ProfilePageWidget(
          who: getParameter(data, 'who'),
        )
      : NavBarPage(initialPage: 'ProfilePageWidget'),
  'Couch': (data) async => NavBarPage(initialPage: 'CouchWidget'),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return json.decode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

T getParameter<T>(Map<String, dynamic> data, String paramName) {
  try {
    if (!data.containsKey(paramName)) {
      return null;
    }
    final param = data[paramName];
    switch (T) {
      case String:
        return param;
      case double:
        return param.toDouble();
      case DateTime:
        return DateTime.fromMillisecondsSinceEpoch(param) as T;
      case LatLng:
        return latLngFromString(param) as T;
    }
    if (param is String) {
      return FirebaseFirestore.instance.doc(param) as T;
    }
    return param;
  } catch (e) {
    print('Error parsing parameter "$paramName": $e');
    return null;
  }
}

Future<T> getDocumentParameter<T>(
    Map<String, dynamic> data, String paramName, Serializer<T> serializer) {
  if (!data.containsKey(paramName)) {
    return null;
  }
  return FirebaseFirestore.instance
      .doc(data[paramName])
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));
}

final latRegex = RegExp(
    r'^(+|-)?(?:90(?:(?:.0{1,7})?)|(?:[0-9]|[1-8][0-9])(?:(?:.[0-9]{1,7})?))$');
final lngRegex = RegExp(
    r'^(+|-)?(?:180(?:(?:.0{1,7})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:.[0-9]{1,7})?))$');

LatLng latLngFromString(String latLngStr) {
  final pieces = latLngStr.split(',');
  if (pieces.length != 2) {
    return null;
  }
  final lat = pieces[0].trim();
  final lng = pieces[1].trim();
  if (!latRegex.hasMatch(lat)) {
    return null;
  }
  if (!lngRegex.hasMatch(lng)) {
    return null;
  }
  return LatLng(double.parse(lat), double.parse(lng));
}
