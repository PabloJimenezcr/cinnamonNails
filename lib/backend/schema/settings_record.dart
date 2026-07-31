import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsRecord extends FirestoreRecord {
  SettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "salonName" field.
  String? _salonName;
  String get salonName => _salonName ?? '';
  bool hasSalonName() => _salonName != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "cancellationPolicy" field.
  String? _cancellationPolicy;
  String get cancellationPolicy => _cancellationPolicy ?? '';
  bool hasCancellationPolicy() => _cancellationPolicy != null;

  void _initializeFields() {
    _salonName = snapshotData['salonName'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _address = snapshotData['address'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _cancellationPolicy = snapshotData['cancellationPolicy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settings');

  static Stream<SettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsRecord.fromSnapshot(s));

  static Future<SettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingsRecord.fromSnapshot(s));

  static SettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsRecordData({
  String? salonName,
  String? phone,
  String? email,
  String? address,
  String? instagram,
  String? facebook,
  String? cancellationPolicy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'salonName': salonName,
      'phone': phone,
      'email': email,
      'address': address,
      'instagram': instagram,
      'facebook': facebook,
      'cancellationPolicy': cancellationPolicy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SettingsRecordDocumentEquality implements Equality<SettingsRecord> {
  const SettingsRecordDocumentEquality();

  @override
  bool equals(SettingsRecord? e1, SettingsRecord? e2) {
    return e1?.salonName == e2?.salonName &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.address == e2?.address &&
        e1?.instagram == e2?.instagram &&
        e1?.facebook == e2?.facebook &&
        e1?.cancellationPolicy == e2?.cancellationPolicy;
  }

  @override
  int hash(SettingsRecord? e) => const ListEquality().hash([
        e?.salonName,
        e?.phone,
        e?.email,
        e?.address,
        e?.instagram,
        e?.facebook,
        e?.cancellationPolicy
      ]);

  @override
  bool isValidKey(Object? o) => o is SettingsRecord;
}
