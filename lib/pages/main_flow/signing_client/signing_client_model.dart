import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class SigningClientModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for Signature widget.
  late SignatureController signatureController;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Backend Call - API (agents )] action in Button-more widget.
  ApiCallResponse? apiResult796;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
    signatureController = SignatureController(
      penStrokeWidth: 2.0,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  void dispose() {
    rowBackModel.dispose();
    signatureController.dispose();
  }

  /// Additional helper methods are added here.

}
