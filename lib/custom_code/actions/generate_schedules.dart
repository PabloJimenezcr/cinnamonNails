// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> generateSchedules() async {
  final firestore = FirebaseFirestore.instance;
  final now = DateTime.now();

  // Normalize 'today' to midnight (00:00:00) to ensure accurate date comparisons
  final today = DateTime(now.year, now.month, now.day);

  // Standard shifts to create for each valid weekday
  final shifts = [
    {
      'startHour': '08:00',
      'endHour': '12:00',
      'breakStart': '10:00',
      'breakEnd': '10:15',
    },
    {
      'startHour': '12:00',
      'endHour': '16:00',
      'breakStart': '14:00',
      'breakEnd': '14:15',
    },
    {
      'startHour': '16:00',
      'endHour': '20:00',
      'breakStart': '18:00',
      'breakEnd': '18:15',
    },
  ];

  // Loop to check and create schedules for the next 5 days
  for (int i = 1; i <= 5; i++) {
    final targetDate = today.add(Duration(days: i));
    final dayOfWeek = targetDate.weekday; // 1 = Monday, 7 = Sunday

    // Skip weekends (Saturday = 6, Sunday = 7)
    if (dayOfWeek == DateTime.saturday || dayOfWeek == DateTime.sunday) {
      continue;
    }

    // Set target date start and end boundaries for checking if it already exists
    final startOfDay = Timestamp.fromDate(targetDate);
    final endOfDay =
        Timestamp.fromDate(targetDate.add(const Duration(days: 1)));

    // Check if schedules already exist for this specific date
    final existingQuery = await firestore
        .collection('schedules')
        .where('day', isGreaterThanOrEqualTo: startOfDay)
        .where('day', isLessThan: endOfDay)
        .get();

    // If no schedules exist for this day yet, create them with DateTime/Timestamp
    if (existingQuery.docs.isEmpty) {
      for (var shift in shifts) {
        await firestore.collection('schedules').add({
          'employee': null, // Unassigned initially
          'day': targetDate, // Saved as a DateTime/Timestamp object
          'startHour': shift['startHour'],
          'endHour': shift['endHour'],
          'breakStart': shift['breakStart'],
          'breakEnd': shift['breakEnd'],
          'active': true,
        });
      }
    }
  }
}
