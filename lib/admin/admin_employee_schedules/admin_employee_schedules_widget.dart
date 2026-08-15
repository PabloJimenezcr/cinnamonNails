import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_employee_schedules_model.dart';
export 'admin_employee_schedules_model.dart';

class AdminEmployeeSchedulesWidget extends StatefulWidget {
  const AdminEmployeeSchedulesWidget({super.key});

  static String routeName = 'adminEmployeeSchedules';
  static String routePath = '/adminEmployeeSchedules';

  @override
  State<AdminEmployeeSchedulesWidget> createState() =>
      _AdminEmployeeSchedulesWidgetState();
}

class _AdminEmployeeSchedulesWidgetState
    extends State<AdminEmployeeSchedulesWidget> {
  late AdminEmployeeSchedulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminEmployeeSchedulesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAF9F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFFAF9F8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 44.0,
            icon: FaIcon(
              FontAwesomeIcons.arrowCircleLeft,
              color: FlutterFlowTheme.of(context).primary,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Horarios',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<List<EmployeesRecord>>(
                    stream: queryEmployeesRecord(
                      queryBuilder: (employeesRecord) => employeesRecord
                          .where(
                            'active',
                            isEqualTo: true,
                          )
                          .orderBy('name', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<EmployeesRecord> dropDownEmployeesRecordList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= '',
                        ),
                        options: List<String>.from(dropDownEmployeesRecordList
                            .map((e) => e.reference.id)
                            .toList()),
                        optionLabels: dropDownEmployeesRecordList
                            .map((e) => valueOrDefault<String>(
                                  e.name,
                                  'Manicurista',
                                ))
                            .toList(),
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.87,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        hintText: 'Select...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        focusBorderColor: FlutterFlowTheme.of(context).tertiary,
                        borderWidth: 1.0,
                        borderRadius: 30.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                  StreamBuilder<List<SchedulesRecord>>(
                    stream: querySchedulesRecord(
                      queryBuilder: (schedulesRecord) => schedulesRecord
                          .where(
                            'active',
                            isEqualTo: true,
                          )
                          .orderBy('day')
                          .orderBy('startHour'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<SchedulesRecord> listViewSchedulesRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewSchedulesRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewSchedulesRecord =
                              listViewSchedulesRecordList[listViewIndex];
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateTimeFormat("yMMMd",
                                            listViewSchedulesRecord.day!),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      if (listViewSchedulesRecord
                                                  .employee?.id !=
                                              null &&
                                          listViewSchedulesRecord
                                                  .employee?.id !=
                                              '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: StreamBuilder<EmployeesRecord>(
                                            stream: EmployeesRecord.getDocument(
                                                listViewSchedulesRecord
                                                    .employee!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final employeeEmployeesRecord =
                                                  snapshot.data!;

                                              return Text(
                                                valueOrDefault<String>(
                                                  employeeEmployeesRecord.name,
                                                  'No assignado',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        dateTimeFormat("MMMMEEEEd",
                                            listViewSchedulesRecord.day!),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF1A1C1C),
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.schedule_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 28.0,
                                      ),
                                      Text(
                                        '${listViewSchedulesRecord.startHour} - ${listViewSchedulesRecord.endHour}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF1A1C1C),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  if (listViewSchedulesRecord.employee == null)
                                    FFButtonWidget(
                                      onPressed: (_model.dropDownValue ==
                                                  null ||
                                              _model.dropDownValue == '')
                                          ? null
                                          : () async {
                                              _model.employeeReference =
                                                  await actions
                                                      .getDocumentRefFromId(
                                                'employees',
                                                _model.dropDownValue!,
                                              );

                                              await listViewSchedulesRecord
                                                  .reference
                                                  .update(
                                                      createSchedulesRecordData(
                                                employee:
                                                    _model.employeeReference,
                                              ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Employee assigned',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                      text: 'Asignar Turno',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        padding: EdgeInsets.all(8.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        disabledColor: Color(0xFFCB5063),
                                        disabledTextColor: Color(0xFFB48D8D),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ]
                    .divide(SizedBox(height: 20.0))
                    .addToStart(SizedBox(height: 24.0))
                    .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
