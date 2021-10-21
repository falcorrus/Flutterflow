import '../backend/backend.dart';
import '../details_page/details_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWidget extends StatefulWidget {
  ListWidget({
    Key key,
    this.who,
  }) : super(key: key);

  final DocumentReference who;

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  TextEditingController nameFieldController;
  bool _loadingButton1 = false;
  double sliderValue;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'SignUp'),
              ),
            );
          },
        ),
        title: Text(
          'Назад',
          style: FlutterFlowTheme.subtitle1.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF151B1E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F5F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x4814181B),
                    offset: Offset(0, 1),
                  )
                ],
              ),
            ),
            Slider(
              activeColor: FlutterFlowTheme.primaryColor,
              inactiveColor: Color(0xFF9E9E9E),
              min: 0,
              max: 10,
              value: sliderValue ??= 0,
              onChanged: (newValue) {
                setState(() => sliderValue = newValue);
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x3A000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white,
                                width: 0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/photoBook.png',
                                          width: 74,
                                          height: 74,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sliderValue.toString(),
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 46,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: Color(0xFF95A1AC),
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Container(
                                                  width: 34,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: Color(0xFFDBE2E7),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 0),
                                                    child: Text(
                                                      '1',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                          .subtitle1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF111417),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 46,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  color: Color(0xFF090F13),
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 16, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '[Price]',
                                                        style: FlutterFlowTheme
                                                            .subtitle1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF151B1E),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x3A000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Proceed to Checkout',
                      options: FFButtonOptions(
                        width: 320,
                        height: 60,
                        color: Color(0xFF03CE9F),
                        textStyle: FlutterFlowTheme.subtitle2.override(
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
                      loading: _loadingButton1,
                    )
                  ],
                ),
              ),
            ),
            TextFormField(
              onChanged: (_) => setState(() {}),
              controller: nameFieldController,
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                suffixIcon: nameFieldController.text.isNotEmpty
                    ? InkWell(
                        onTap: () => setState(
                          () => nameFieldController.clear(),
                        ),
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
              ),
            ),
            Expanded(
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(),
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
                  List<UsersRecord> listViewUsersRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFB8AFAF),
                            elevation: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      listViewUsersRecord.photoUrl,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .email,
                                                        'no email',
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color: Color(0xFFCC0F0F),
                                                      size: 24,
                                                    )
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.favorite_border,
                                                  color: Color(0xFFCC0F0F),
                                                  size: 24,
                                                )
                                              ],
                                            ),
                                            Text(
                                              listViewUsersRecord.displayName,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton2 = true);
                                                  try {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsPageWidget(
                                                          candidate:
                                                              listViewUsersRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton2 =
                                                            false);
                                                  }
                                                },
                                                text: 'Button',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 28,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                  elevation: 1,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
