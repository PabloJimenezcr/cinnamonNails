import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_appointments_widget.dart' show AdminAppointmentsWidget;
import 'package:flutter/material.dart';

class AdminAppointmentsModel extends FlutterFlowModel<AdminAppointmentsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
