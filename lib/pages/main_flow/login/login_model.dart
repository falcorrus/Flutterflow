import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField-mail widget.
  TextEditingController? textFieldMailController;
  String? Function(BuildContext, String?)? textFieldMailControllerValidator;
  // State field(s) for TextField-password widget.
  TextEditingController? textFieldPasswordController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)? textFieldPasswordControllerValidator;
  // Stores action output result for [Backend Call - API (login new)] action in Button widget.
  ApiCallResponse? loginResult;
  // Stores action output result for [Backend Call - API (agents new)] action in Button widget.
  ApiCallResponse? apiResultvw9Copy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
  }

  void dispose() {
    textFieldMailController?.dispose();
    textFieldPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
