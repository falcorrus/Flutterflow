import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'other_record.g.dart';

abstract class OtherRecord implements Built<OtherRecord, OtherRecordBuilder> {
  static Serializer<OtherRecord> get serializer => _$otherRecordSerializer;

  @nullable
  bool get a1;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OtherRecordBuilder builder) =>
      builder..a1 = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Other');

  static Stream<OtherRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OtherRecord._();
  factory OtherRecord([void Function(OtherRecordBuilder) updates]) =
      _$OtherRecord;

  static OtherRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createOtherRecordData({
  bool a1,
}) =>
    serializers.toFirestore(
        OtherRecord.serializer, OtherRecord((o) => o..a1 = a1));
