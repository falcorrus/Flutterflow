import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get password2;

  @nullable
  String get name;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: 'Login')
  String get login;

  @nullable
  @BuiltValueField(wireName: 'NotificationTrue')
  bool get notificationTrue;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..password2 = ''
    ..name = ''
    ..password = ''
    ..login = ''
    ..notificationTrue = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..password2 = snapshot.data['password2']
          ..name = snapshot.data['name']
          ..password = snapshot.data['password']
          ..login = snapshot.data['Login']
          ..notificationTrue = snapshot.data['NotificationTrue']
          ..reference = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String password2,
  String name,
  String password,
  String login,
  bool notificationTrue,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..password2 = password2
          ..name = name
          ..password = password
          ..login = login
          ..notificationTrue = notificationTrue));
