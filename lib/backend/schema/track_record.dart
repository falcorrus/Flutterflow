import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'track_record.g.dart';

abstract class TrackRecord implements Built<TrackRecord, TrackRecordBuilder> {
  static Serializer<TrackRecord> get serializer => _$trackRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  DocumentReference get name;

  @nullable
  int get payment;

  @nullable
  int get subTotal;

  @nullable
  int get trackID;

  @nullable
  DocumentReference get coach;

  @nullable
  String get dayTrackOnly;

  @nullable
  String get emailCoach;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TrackRecordBuilder builder) => builder
    ..payment = 0
    ..subTotal = 0
    ..trackID = 0
    ..dayTrackOnly = ''
    ..emailCoach = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('track');

  static Stream<TrackRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TrackRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TrackRecord._();
  factory TrackRecord([void Function(TrackRecordBuilder) updates]) =
      _$TrackRecord;

  static TrackRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTrackRecordData({
  DateTime date,
  DocumentReference name,
  int payment,
  int subTotal,
  int trackID,
  DocumentReference coach,
  String dayTrackOnly,
  String emailCoach,
}) =>
    serializers.toFirestore(
        TrackRecord.serializer,
        TrackRecord((t) => t
          ..date = date
          ..name = name
          ..payment = payment
          ..subTotal = subTotal
          ..trackID = trackID
          ..coach = coach
          ..dayTrackOnly = dayTrackOnly
          ..emailCoach = emailCoach));
