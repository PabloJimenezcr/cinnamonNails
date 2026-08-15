import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  // "schedule" field.
  DocumentReference? _schedule;
  DocumentReference? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  // "employee" field.
  DocumentReference? _employee;
  DocumentReference? get employee => _employee;
  bool hasEmployee() => _employee != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _finished = snapshotData['finished'] as bool?;
    _schedule = snapshotData['schedule'] as DocumentReference?;
    _employee = snapshotData['employee'] as DocumentReference?;
    _service = snapshotData['service'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _day = snapshotData['day'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  DateTime? createdAt,
  bool? finished,
  DocumentReference? schedule,
  DocumentReference? employee,
  DocumentReference? service,
  DocumentReference? user,
  bool? active,
  DateTime? day,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'finished': finished,
      'schedule': schedule,
      'employee': employee,
      'service': service,
      'user': user,
      'active': active,
      'day': day,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.finished == e2?.finished &&
        e1?.schedule == e2?.schedule &&
        e1?.employee == e2?.employee &&
        e1?.service == e2?.service &&
        e1?.user == e2?.user &&
        e1?.active == e2?.active &&
        e1?.day == e2?.day;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.finished,
        e?.schedule,
        e?.employee,
        e?.service,
        e?.user,
        e?.active,
        e?.day
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
