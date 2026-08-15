import '/flutter_flow/flutter_flow_util.dart';
import 'password_recovery_widget.dart' show PasswordRecoveryWidget;
import 'package:flutter/material.dart';

class PasswordRecoveryModel extends FlutterFlowModel<PasswordRecoveryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailRecoveryPassword widget.
  FocusNode? emailRecoveryPasswordFocusNode;
  TextEditingController? emailRecoveryPasswordTextController;
  String? Function(BuildContext, String?)?
      emailRecoveryPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailRecoveryPasswordFocusNode?.dispose();
    emailRecoveryPasswordTextController?.dispose();
  }
}
