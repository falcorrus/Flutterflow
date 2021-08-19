import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_collection_record.g.dart';

abstract class TestCollectionRecord
    implements Built<TestCollectionRecord, TestCollectionRecordBuilder> {
  static Serializer<TestCollectionRecord> get serializer =>
      _$testCollectionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestCollectionRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TestCollection');

  static Stream<TestCollectionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestCollectionRecord._();
  factory TestCollectionRecord(
          [void Function(TestCollectionRecordBuilder) updates]) =
      _$TestCollectionRecord;

  static TestCollectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestCollectionRecordData() =>
    serializers.toFirestore(
        TestCollectionRecord.serializer, TestCollectionRecord((t) => t));
