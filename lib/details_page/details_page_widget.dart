import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPageWidget extends StatefulWidget {
  DetailsPageWidget({
    Key key,
    this.candidate,
  }) : super(key: key);

  final DocumentReference candidate;

  @override
  _DetailsPageWidgetState createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  TextEditingController yourEmailController;
  TextEditingController yourNameController;
  TextEditingController yourPhoneController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.candidate),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitChasingDots(
                color: Color(0xFF561F51),
                size: 50,
              ),
            ),
          );
        }
        final detailsPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF8B97A2),
                size: 24,
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Edit Profile',
                  style: FlutterFlowTheme.subtitle1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF8B97A2),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                  child: Text(
                    detailsPageUsersRecord.email,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF1F4F8),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Image.asset(
                                  'assets/images/card_header@2x.png',
                                  width: MediaQuery.of(context).size.width,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  children: [],
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: StreamBuilder<UsersRecord>(
                                stream:
                                    UsersRecord.getDocument(widget.candidate),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitChasingDots(
                                          color: Color(0xFF561F51),
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final circleImageUsersRecord = snapshot.data;
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      detailsPageUsersRecord.photoUrl,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Edit Image',
                              style: GoogleFonts.getFont(
                                'DM Sans',
                                color: Color(0xFF4B39EF),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: TextFormField(
                                          controller: yourEmailController ??=
                                              TextEditingController(
                                            text: detailsPageUsersRecord.email,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Your Email',
                                            labelStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.mailBulk,
                                              color: Color(0xFF3F51B5),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: TextFormField(
                                          controller: yourNameController ??=
                                              TextEditingController(
                                            text: detailsPageUsersRecord
                                                .displayName,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                            labelStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            hintText: 'Ваш телефон для связи',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF8B97A2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.napster,
                                              color: Color(0xFF3F51B5),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: TextFormField(
                                          controller: yourPhoneController ??=
                                              TextEditingController(
                                            text: detailsPageUsersRecord
                                                .phoneNumber,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Phone',
                                            labelStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            hintText: 'Ваш телефон для связи',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF8B97A2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            prefixIcon: FaIcon(
                                              FontAwesomeIcons.phoneSquareAlt,
                                              color: Color(0xFF3F51B5),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60, 20, 60, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => _loadingButton = true);
                                      try {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          email:
                                              yourEmailController?.text ?? '',
                                          displayName:
                                              yourNameController?.text ?? '',
                                        );
                                        await detailsPageUsersRecord.reference
                                            .update(usersUpdateData);
                                      } finally {
                                        setState(() => _loadingButton = false);
                                      }
                                    },
                                    text: 'Proceed to Checkout',
                                    options: FFButtonOptions(
                                      width: 320,
                                      height: 60,
                                      color: Color(0xFF03CE9F),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 8,
                                    ),
                                    loading: _loadingButton,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
