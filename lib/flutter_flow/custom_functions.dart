import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int numPayments(List<DocumentReference> payment) {
  // return the length of the list
  int c = 0;
  c = payment.length;
  return c;
}

int sumPayments(List<int> payment) {
  // get sum of payment items
  int c = payment.fold(0, (int total, int subtotal) => subtotal + total);
  return c;
}

int numUsers(List<DocumentReference> email) {
  // return the length of the list
  int c = 0;
  c = email.length;
  return c;
}

String currDayTrack(DateTime timesta) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formattedNow = formatter.format(timesta);
  return formattedNow; // }
}

String currDayNow() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formattedNow = formatter.format(now);
  return formattedNow; // date without hours and min
}
