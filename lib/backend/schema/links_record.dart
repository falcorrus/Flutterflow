import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'links_record.g.dart';

abstract class LinksRecord implements Built<LinksRecord, LinksRecordBuilder> {
  static Serializer<LinksRecord> get serializer => _$linksRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get raspis;

  @nullable
  DateTime get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LinksRecordBuilder builder) => builder
    ..title = ''
    ..raspis = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('links');

  static Stream<LinksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LinksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LinksRecord._();
  factory LinksRecord([void Function(LinksRecordBuilder) updates]) =
      _$LinksRecord;

  static LinksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLinksRecordData({
  String title,
  String raspis,
  DateTime time,
}) =>
    serializers.toFirestore(
        LinksRecord.serializer,
        LinksRecord((l) => l
          ..title = title
          ..raspis = raspis
          ..time = time));
