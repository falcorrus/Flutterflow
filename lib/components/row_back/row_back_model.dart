import '/components/red_record/red_record_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RowBackModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for RedRecord component.
  late RedRecordModel redRecordModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    redRecordModel = createModel(context, () => RedRecordModel());
  }

  void dispose() {
    redRecordModel.dispose();
  }

  /// Additional helper methods are added here.

}
