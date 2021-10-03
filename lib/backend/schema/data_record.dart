import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_record.g.dart';

abstract class DataRecord implements Built<DataRecord, DataRecordBuilder> {
  static Serializer<DataRecord> get serializer => _$dataRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Who')
  DocumentReference get who;

  @nullable
  String get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataRecordBuilder builder) =>
      builder..date = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data');

  static Stream<DataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataRecord._();
  factory DataRecord([void Function(DataRecordBuilder) updates]) = _$DataRecord;

  static DataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataRecordData({
  DocumentReference who,
  String date,
}) =>
    serializers.toFirestore(
        DataRecord.serializer,
        DataRecord((d) => d
          ..who = who
          ..date = date));
