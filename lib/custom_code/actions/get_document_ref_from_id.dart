// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// CREATE A CUSTOM ACTION TO GET A DOCUMENT REFERENCE FROM A DOCUMENT REFERENCE ID STRING ASK FOR THE COLECTION NAME TOO
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> getDocumentRefFromId(
  String collectionName,
  String documentId,
) async {
  try {
    if (collectionName.isEmpty || documentId.isEmpty) {
      return null;
    }

    final DocumentReference docRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentId);

    final DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docRef;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('Error getting document reference: $e');
    return null;
  }
}
