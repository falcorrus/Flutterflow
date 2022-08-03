import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../track_record/track_record_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TracksWidget extends StatefulWidget {
  const TracksWidget({
    Key key,
    this.docRef,
    this.a2,
  }) : super(key: key);

  final DocumentReference docRef;
  final String a2;

  @override
  _TracksWidgetState createState() => _TracksWidgetState();
}

class _TracksWidgetState extends State<TracksWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> tracksUsersRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Тренировки',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: true,
            elevation: 1,
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<UsersRecord>>(
                    future: queryUsersRecordOnce(
                      queryBuilder: (usersRecord) =>
                          usersRecord.where('userRole', isEqualTo: 'coach'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitCircle(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> listViewUsersRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewUsersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsersRecord =
                              listViewUsersRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: InkWell(
                              onTap: () async {
                                setState(() => FFAppState().emailCoach =
                                    listViewUsersRecord.email);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.27,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().emailCoach =
                                                  listViewUsersRecord.email);
                                        },
                                        child: Text(
                                          listViewUsersRecord.displayName,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontSize: 16,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                StreamBuilder<List<TrackRecord>>(
                  stream: queryTrackRecord(
                    queryBuilder: (trackRecord) => trackRecord
                        .where('emailCoach', isEqualTo: FFAppState().emailCoach)
                        .orderBy('date', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<TrackRecord> columnMainTrackRecordList = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnMainTrackRecordList.length,
                          (columnMainIndex) {
                        final columnMainTrackRecord =
                            columnMainTrackRecordList[columnMainIndex];
                        return FutureBuilder<UsersRecord>(
                          future: UsersRecord.getDocumentOnce(
                              columnMainTrackRecord.name),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            final container1UsersRecord = snapshot.data;
                            return Container(
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0, 0),
                              child: FutureBuilder<UsersRecord>(
                                future: UsersRecord.getDocumentOnce(
                                    columnMainTrackRecord.coach),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnUsersRecord = snapshot.data;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.scale,
                                              alignment: Alignment.bottomCenter,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: TrackRecordWidget(
                                                track: columnMainTrackRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Slidable(
                                          actionPane:
                                              const SlidableScrollActionPane(),
                                          secondaryActions: [
                                            IconSlideAction(
                                              caption: 'Delete',
                                              color: Color(0xFFF34A36),
                                              icon: Icons.delete,
                                              onTap: () async {
                                                await columnMainTrackRecord
                                                    .reference
                                                    .delete();
                                              },
                                            ),
                                          ],
                                          child: ListTile(
                                            title: Text(
                                              container1UsersRecord.displayName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              columnUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                            trailing: Icon(
                                              Icons.chevron_left_sharp,
                                              color: Color(0xFF303030),
                                              size: 20,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }),
                    ).animated([animationsMap['columnOnPageLoadAnimation']]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
