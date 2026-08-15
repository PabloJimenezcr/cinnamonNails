import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appointment_re_schedule_widget.dart' show AppointmentReScheduleWidget;
import 'package:flutter/material.dart';

class AppointmentReScheduleModel
    extends FlutterFlowModel<AppointmentReScheduleWidget> {
  ///  Local state fields for this page.

  SchedulesRecord? selectedScheduleDocument;

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
