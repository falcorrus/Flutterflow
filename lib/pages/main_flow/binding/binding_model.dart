import '/components/binding_done/binding_done_widget.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BindingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for row_back component.
  late RowBackModel rowBackModel;
  // State field(s) for InputField-6 widget.
  TextEditingController? inputField6Controller;
  final inputField6Mask = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)? inputField6ControllerValidator;
  // State field(s) for InputField-4 widget.
  TextEditingController? inputField4Controller;
  final inputField4Mask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? inputField4ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rowBackModel = createModel(context, () => RowBackModel());
  }

  void dispose() {
    rowBackModel.dispose();
    inputField6Controller?.dispose();
    inputField4Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
