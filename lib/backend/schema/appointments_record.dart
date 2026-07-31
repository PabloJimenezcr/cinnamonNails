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

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "employeeId" field.
  DocumentReference? _employeeId;
  DocumentReference? get employeeId => _employeeId;
  bool hasEmployeeId() => _employeeId != null;

  // "serviceId" field.
  DocumentReference? _serviceId;
  DocumentReference? get serviceId => _serviceId;
  bool hasServiceId() => _serviceId != null;

  // "appointmentDate" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _employeeId = snapshotData['employeeId'] as DocumentReference?;
    _serviceId = snapshotData['serviceId'] as DocumentReference?;
    _appointmentDate = snapshotData['appointmentDate'] as DateTime?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
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
  DocumentReference? userId,
  DocumentReference? employeeId,
  DocumentReference? serviceId,
  DateTime? appointmentDate,
  DateTime? startTime,
  DateTime? endTime,
  String? status,
  double? totalPrice,
  String? notes,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'employeeId': employeeId,
      'serviceId': serviceId,
      'appointmentDate': appointmentDate,
      'startTime': startTime,
      'endTime': endTime,
      'status': status,
      'totalPrice': totalPrice,
      'notes': notes,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.employeeId == e2?.employeeId &&
        e1?.serviceId == e2?.serviceId &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.status == e2?.status &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.employeeId,
        e?.serviceId,
        e?.appointmentDate,
        e?.startTime,
        e?.endTime,
        e?.status,
        e?.totalPrice,
        e?.notes,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
