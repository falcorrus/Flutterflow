// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrackRecord> _$trackRecordSerializer = new _$TrackRecordSerializer();

class _$TrackRecordSerializer implements StructuredSerializer<TrackRecord> {
  @override
  final Iterable<Type> types = const [TrackRecord, _$TrackRecord];
  @override
  final String wireName = 'TrackRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TrackRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.payment;
    if (value != null) {
      result
        ..add('payment')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subTotal;
    if (value != null) {
      result
        ..add('subTotal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.trackID;
    if (value != null) {
      result
        ..add('trackID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.coach;
    if (value != null) {
      result
        ..add('coach')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dayTrackOnly;
    if (value != null) {
      result
        ..add('dayTrackOnly')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailCoach;
    if (value != null) {
      result
        ..add('emailCoach')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  TrackRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrackRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'payment':
          result.payment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subTotal':
          result.subTotal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'trackID':
          result.trackID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'coach':
          result.coach = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'dayTrackOnly':
          result.dayTrackOnly = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailCoach':
          result.emailCoach = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$TrackRecord extends TrackRecord {
  @override
  final DateTime date;
  @override
  final DocumentReference<Object> name;
  @override
  final int payment;
  @override
  final int subTotal;
  @override
  final int trackID;
  @override
  final DocumentReference<Object> coach;
  @override
  final String dayTrackOnly;
  @override
  final String emailCoach;
  @override
  final DocumentReference<Object> reference;

  factory _$TrackRecord([void Function(TrackRecordBuilder) updates]) =>
      (new TrackRecordBuilder()..update(updates)).build();

  _$TrackRecord._(
      {this.date,
      this.name,
      this.payment,
      this.subTotal,
      this.trackID,
      this.coach,
      this.dayTrackOnly,
      this.emailCoach,
      this.reference})
      : super._();

  @override
  TrackRecord rebuild(void Function(TrackRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrackRecordBuilder toBuilder() => new TrackRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrackRecord &&
        date == other.date &&
        name == other.name &&
        payment == other.payment &&
        subTotal == other.subTotal &&
        trackID == other.trackID &&
        coach == other.coach &&
        dayTrackOnly == other.dayTrackOnly &&
        emailCoach == other.emailCoach &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, date.hashCode), name.hashCode),
                                payment.hashCode),
                            subTotal.hashCode),
                        trackID.hashCode),
                    coach.hashCode),
                dayTrackOnly.hashCode),
            emailCoach.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrackRecord')
          ..add('date', date)
          ..add('name', name)
          ..add('payment', payment)
          ..add('subTotal', subTotal)
          ..add('trackID', trackID)
          ..add('coach', coach)
          ..add('dayTrackOnly', dayTrackOnly)
          ..add('emailCoach', emailCoach)
          ..add('reference', reference))
        .toString();
  }
}

class TrackRecordBuilder implements Builder<TrackRecord, TrackRecordBuilder> {
  _$TrackRecord _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  DocumentReference<Object> _name;
  DocumentReference<Object> get name => _$this._name;
  set name(DocumentReference<Object> name) => _$this._name = name;

  int _payment;
  int get payment => _$this._payment;
  set payment(int payment) => _$this._payment = payment;

  int _subTotal;
  int get subTotal => _$this._subTotal;
  set subTotal(int subTotal) => _$this._subTotal = subTotal;

  int _trackID;
  int get trackID => _$this._trackID;
  set trackID(int trackID) => _$this._trackID = trackID;

  DocumentReference<Object> _coach;
  DocumentReference<Object> get coach => _$this._coach;
  set coach(DocumentReference<Object> coach) => _$this._coach = coach;

  String _dayTrackOnly;
  String get dayTrackOnly => _$this._dayTrackOnly;
  set dayTrackOnly(String dayTrackOnly) => _$this._dayTrackOnly = dayTrackOnly;

  String _emailCoach;
  String get emailCoach => _$this._emailCoach;
  set emailCoach(String emailCoach) => _$this._emailCoach = emailCoach;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TrackRecordBuilder() {
    TrackRecord._initializeBuilder(this);
  }

  TrackRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _name = $v.name;
      _payment = $v.payment;
      _subTotal = $v.subTotal;
      _trackID = $v.trackID;
      _coach = $v.coach;
      _dayTrackOnly = $v.dayTrackOnly;
      _emailCoach = $v.emailCoach;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrackRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrackRecord;
  }

  @override
  void update(void Function(TrackRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TrackRecord build() {
    final _$result = _$v ??
        new _$TrackRecord._(
            date: date,
            name: name,
            payment: payment,
            subTotal: subTotal,
            trackID: trackID,
            coach: coach,
            dayTrackOnly: dayTrackOnly,
            emailCoach: emailCoach,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
