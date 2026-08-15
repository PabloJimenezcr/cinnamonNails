import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_user_model.dart';
export 'home_user_model.dart';

class HomeUserWidget extends StatefulWidget {
  const HomeUserWidget({super.key});

  static String routeName = 'homeUser';
  static String routePath = '/homeUser';

  @override
  State<HomeUserWidget> createState() => _HomeUserWidgetState();
}

class _HomeUserWidgetState extends State<HomeUserWidget> {
  late HomeUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeUserModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hola, ',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          '👋🏼',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 140.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: StreamBuilder<List<AppointmentsRecord>>(
                            stream: queryAppointmentsRecord(
                              queryBuilder: (appointmentsRecord) =>
                                  appointmentsRecord
                                      .where(
                                        'user',
                                        isEqualTo: currentUserReference,
                                      )
                                      .orderBy('day'),
                              singleRecord: true,
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
                              List<AppointmentsRecord>
                                  rowAppointmentsRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final rowAppointmentsRecord =
                                  rowAppointmentsRecordList.isNotEmpty
                                      ? rowAppointmentsRecordList.first
                                      : null;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StreamBuilder<ServicesRecord>(
                                    stream: ServicesRecord.getDocument(
                                        rowAppointmentsRecord!.service!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final columnServicesRecord =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Próxima cita',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              columnServicesRecord.name,
                                              'Sin reservaciones!',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 20.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat(
                                                      "MMMMEEEEd",
                                                      rowAppointmentsRecord
                                                          .day),
                                                  'Agende una cita por favor.',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      );
                                    },
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.qr_code_2_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 48.0,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ServicesClientWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Agendar',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ServicesClientWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.spa_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Servicios',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              AppointmentManagementWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.history_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Mis citas',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ProductsClientWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.production_quantity_limits,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Productos',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Promociones',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 131.0,
                          child: Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Oferta limitada',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 40.0, 0.0, 0.0),
                                          child: Text(
                                            '50% en gel color',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/fotoGelColor.png',
                                            width: 353.4,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            alignment: Alignment(1.0, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Pack amigas',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 40.0, 0.0, 0.0),
                                          child: Text(
                                            '20% en Manicure spa',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/fotoGelColor2.png',
                                            width: 353.95,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            alignment: Alignment(1.0, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 353.9,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Oferta limitada',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 40.0, 0.0, 0.0),
                                          child: Text(
                                            '10% en Pedicure By OPI',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/fotoGelColor3.png',
                                            width: 354.88,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            alignment: Alignment(1.0, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 353.9,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'Pack matrimonio',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 40.0, 0.0, 0.0),
                                          child: Text(
                                            '50% en Pedicure Spa',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/fotoGelColor4.png',
                                            width: 354.9,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            alignment: Alignment(1.0, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 120.0, 0.0, 0.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 4,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8.0,
                                        radius: 8.0,
                                        dotWidth: 8.0,
                                        dotHeight: 8.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Servicios',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    StreamBuilder<List<ServicesRecord>>(
                      stream: queryServicesRecord(
                        queryBuilder: (servicesRecord) => servicesRecord.where(
                          'active',
                          isEqualTo: true,
                        ),
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
                        List<ServicesRecord> gridViewServicesRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 1.0,
                            childAspectRatio: 0.8,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewServicesRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewServicesRecord =
                                gridViewServicesRecordList[gridViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ServiceDetailWidget.routeName,
                                    queryParameters: {
                                      'service': serializeParam(
                                        gridViewServicesRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'service': gridViewServicesRecord,
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        '${gridViewServicesRecord.imageUrl}',
                                        width: double.infinity,
                                        height: 140.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      gridViewServicesRecord.name,
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
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '₡',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          gridViewServicesRecord.price
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 6.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 16.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.098,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            HomeUserWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                Icons.house_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Inicio',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            ServicesClientWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                Icons.spa_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Servicios',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            AppointmentManagementWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Mis citas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.pushNamedAuth(
                            LoginWidget.routeName,
                            context.mounted,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Icon(
                                Icons.logout_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Cerrar sesión',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
