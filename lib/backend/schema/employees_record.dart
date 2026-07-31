import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeesRecord extends FirestoreRecord {
  EmployeesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "specialty" field.
  String? _specialty;
  String get specialty => _specialty ?? '';
  bool hasSpecialty() => _specialty != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _photo = snapshotData['photo'] as String?;
    _specialty = snapshotData['specialty'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('employees');

  static Stream<EmployeesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmployeesRecord.fromSnapshot(s));

  static Future<EmployeesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmployeesRecord.fromSnapshot(s));

  static EmployeesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmployeesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmployeesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmployeesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmployeesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmployeesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmployeesRecordData({
  String? name,
  String? email,
  String? phone,
  String? photo,
  String? specialty,
  bool? active,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
      'specialty': specialty,
      'active': active,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmployeesRecordDocumentEquality implements Equality<EmployeesRecord> {
  const EmployeesRecordDocumentEquality();

  @override
  bool equals(EmployeesRecord? e1, EmployeesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.photo == e2?.photo &&
        e1?.specialty == e2?.specialty &&
        e1?.active == e2?.active &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(EmployeesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.phone,
        e?.photo,
        e?.specialty,
        e?.active,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is EmployeesRecord;
}
