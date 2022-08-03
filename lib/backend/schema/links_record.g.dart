// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinksRecord> _$linksRecordSerializer = new _$LinksRecordSerializer();

class _$LinksRecordSerializer implements StructuredSerializer<LinksRecord> {
  @override
  final Iterable<Type> types = const [LinksRecord, _$LinksRecord];
  @override
  final String wireName = 'LinksRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LinksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.raspis;
    if (value != null) {
      result
        ..add('raspis')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  LinksRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'raspis':
          result.raspis = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$LinksRecord extends LinksRecord {
  @override
  final String title;
  @override
  final String raspis;
  @override
  final DateTime time;
  @override
  final DocumentReference<Object> reference;

  factory _$LinksRecord([void Function(LinksRecordBuilder) updates]) =>
      (new LinksRecordBuilder()..update(updates)).build();

  _$LinksRecord._({this.title, this.raspis, this.time, this.reference})
      : super._();

  @override
  LinksRecord rebuild(void Function(LinksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinksRecordBuilder toBuilder() => new LinksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinksRecord &&
        title == other.title &&
        raspis == other.raspis &&
        time == other.time &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), raspis.hashCode), time.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinksRecord')
          ..add('title', title)
          ..add('raspis', raspis)
          ..add('time', time)
          ..add('reference', reference))
        .toString();
  }
}

class LinksRecordBuilder implements Builder<LinksRecord, LinksRecordBuilder> {
  _$LinksRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _raspis;
  String get raspis => _$this._raspis;
  set raspis(String raspis) => _$this._raspis = raspis;

  DateTime _time;
  DateTime get time => _$this._time;
  set time(DateTime time) => _$this._time = time;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LinksRecordBuilder() {
    LinksRecord._initializeBuilder(this);
  }

  LinksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _raspis = $v.raspis;
      _time = $v.time;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LinksRecord;
  }

  @override
  void update(void Function(LinksRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LinksRecord build() {
    final _$result = _$v ??
        new _$LinksRecord._(
            title: title, raspis: raspis, time: time, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
