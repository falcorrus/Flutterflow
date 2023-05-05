import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_move_meeting_model.dart';
export 'status_move_meeting_model.dart';

class StatusMoveMeetingWidget extends StatefulWidget {
  const StatusMoveMeetingWidget({
    Key? key,
    this.slug,
  }) : super(key: key);

  final String? slug;

  @override
  _StatusMoveMeetingWidgetState createState() =>
      _StatusMoveMeetingWidgetState();
}

class _StatusMoveMeetingWidgetState extends State<StatusMoveMeetingWidget> {
  late StatusMoveMeetingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusMoveMeetingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'status',
                              queryParams: {
                                'slug': serializeParam(
                                  widget.slug,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 14.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm5fby93n' /* Назад */,
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 10.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '55qr61bu' /* Перенос встречи */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Montserrat',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    FlutterFlowCalendar(
                      color: FlutterFlowTheme.of(context).primary,
                      weekFormat: false,
                      weekStartsMonday: true,
                      initialDate: getCurrentTimestamp,
                      onChange: (DateTimeRange? newSelectedDate) {
                        setState(() =>
                            _model.calendarDateSelectedDay = newSelectedDate);
                      },
                      titleStyle: TextStyle(),
                      dayOfWeekStyle: FlutterFlowTheme.of(context).bodyMedium,
                      dateStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF4460F0),
                                fontSize: 20.0,
                                letterSpacing: 0.38,
                                fontWeight: FontWeight.normal,
                              ),
                      selectedDateStyle: TextStyle(),
                      inactiveDateStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 25.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sy1wenxi' /* Время старта */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (kIsWeb) {
                                final _datePicked1Time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      getCurrentTimestamp),
                                );
                                if (_datePicked1Time != null) {
                                  setState(() {
                                    _model.datePicked1 = DateTime(
                                      getCurrentTimestamp.year,
                                      getCurrentTimestamp.month,
                                      getCurrentTimestamp.day,
                                      _datePicked1Time.hour,
                                      _datePicked1Time.minute,
                                    );
                                  });
                                }
                              } else {
                                await DatePicker.showTimePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() {
                                      _model.datePicked1 = date;
                                    });
                                  },
                                  currentTime: getCurrentTimestamp,
                                  locale: LocaleType.values.firstWhere(
                                    (l) =>
                                        l.name ==
                                        FFLocalizations.of(context)
                                            .languageCode,
                                    orElse: () => LocaleType.en,
                                  ),
                                );
                              }

                              FFAppState().update(() {
                                FFAppState().startTime = _model.datePicked1;
                              });
                            },
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                FFAppState().startTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '0',
                            ),
                            options: FFButtonOptions(
                              width: 138.0,
                              height: 43.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).lineColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 16.0, 25.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mkzngsml' /* Время окончания */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (kIsWeb) {
                                final _datePicked2Time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      getCurrentTimestamp),
                                );
                                if (_datePicked2Time != null) {
                                  setState(() {
                                    _model.datePicked2 = DateTime(
                                      getCurrentTimestamp.year,
                                      getCurrentTimestamp.month,
                                      getCurrentTimestamp.day,
                                      _datePicked2Time.hour,
                                      _datePicked2Time.minute,
                                    );
                                  });
                                }
                              } else {
                                await DatePicker.showTimePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() {
                                      _model.datePicked2 = date;
                                    });
                                  },
                                  currentTime: getCurrentTimestamp,
                                  locale: LocaleType.values.firstWhere(
                                    (l) =>
                                        l.name ==
                                        FFLocalizations.of(context)
                                            .languageCode,
                                    orElse: () => LocaleType.en,
                                  ),
                                );
                              }

                              FFAppState().update(() {
                                FFAppState().EndTime = _model.datePicked2;
                              });
                            },
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                FFAppState().EndTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '0',
                            ),
                            options: FFButtonOptions(
                              width: 138.0,
                              height: 43.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).lineColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 28.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.apiResult5q1 =
                            await HappyTestAPIGroup.meetingCall.call(
                          slug: widget.slug,
                          token: FFAppState().Token,
                          date: functions
                              .date(_model.calendarDateSelectedDay!.start),
                          start: valueOrDefault<String>(
                            functions.timeFunc(FFAppState().startTime!),
                            '1664452800',
                          ),
                          finish: valueOrDefault<String>(
                            functions.timeFunc(FFAppState().EndTime!),
                            '1664452800',
                          ),
                        );

                        context.pushNamed('OrdersList');

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '76vwoawz' /* ПЕРЕНЕСТИ */,
                      ),
                      options: FFButtonOptions(
                        width: 327.0,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4460F0),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.5,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
