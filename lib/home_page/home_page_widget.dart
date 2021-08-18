import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFE6E6E6),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFE6E6E6),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Profile',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'Recent measurements\\n',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xFF607D8B),
            ),
          ),
          Container(
            width: 100,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/80/600',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFE6E6E6),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        'Pour Over - Kilenso\\n',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '19,5%',
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Espresso',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFE6E6E6),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        'Pour Over - Kilenso\\n',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '19,5%',
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Espresso',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFE6E6E6),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        'Pour Over - Kilenso\\n',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '19,5%',
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Espresso',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Measurecoffe pressed ...');
                      },
                      text: 'Measure coffee',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        color: Color(0xFF4099F7),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
