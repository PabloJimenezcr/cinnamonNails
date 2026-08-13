import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchedulesRecord extends FirestoreRecord {
  SchedulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee" field.
  DocumentReference? _employee;
  DocumentReference? get employee => _employee;
  bool hasEmployee() => _employee != null;

  // "startHour" field.
  String? _startHour;
  String get startHour => _startHour ?? '';
  bool hasStartHour() => _startHour != null;

  // "endHour" field.
  String? _endHour;
  String get endHour => _endHour ?? '';
  bool hasEndHour() => _endHour != null;

  // "breakStart" field.
  String? _breakStart;
  String get breakStart => _breakStart ?? '';
  bool hasBreakStart() => _breakStart != null;

  // "breakEnd" field.
  String? _breakEnd;
  String get breakEnd => _breakEnd ?? '';
  bool hasBreakEnd() => _breakEnd != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  void _initializeFields() {
    _employee = snapshotData['employee'] as DocumentReference?;
    _startHour = snapshotData['startHour'] as String?;
    _endHour = snapshotData['endHour'] as String?;
    _breakStart = snapshotData['breakStart'] as String?;
    _breakEnd = snapshotData['breakEnd'] as String?;
    _active = snapshotData['active'] as bool?;
    _day = snapshotData['day'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schedules');

  static Stream<SchedulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchedulesRecord.fromSnapshot(s));

  static Future<SchedulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchedulesRecord.fromSnapshot(s));

  static SchedulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchedulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchedulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchedulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchedulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchedulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchedulesRecordData({
  DocumentReference? employee,
  String? startHour,
  String? endHour,
  String? breakStart,
  String? breakEnd,
  bool? active,
  DateTime? day,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee': employee,
      'startHour': startHour,
      'endHour': endHour,
      'breakStart': breakStart,
      'breakEnd': breakEnd,
      'active': active,
      'day': day,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchedulesRecordDocumentEquality implements Equality<SchedulesRecord> {
  const SchedulesRecordDocumentEquality();

  @override
  bool equals(SchedulesRecord? e1, SchedulesRecord? e2) {
    return e1?.employee == e2?.employee &&
        e1?.startHour == e2?.startHour &&
        e1?.endHour == e2?.endHour &&
        e1?.breakStart == e2?.breakStart &&
        e1?.breakEnd == e2?.breakEnd &&
        e1?.active == e2?.active &&
        e1?.day == e2?.day;
  }

  @override
  int hash(SchedulesRecord? e) => const ListEquality().hash([
        e?.employee,
        e?.startHour,
        e?.endHour,
        e?.breakStart,
        e?.breakEnd,
        e?.active,
        e?.day
      ]);

  @override
  bool isValidKey(Object? o) => o is SchedulesRecord;
}
