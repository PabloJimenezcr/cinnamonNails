import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  bool rememberMe = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  // State field(s) for passwordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    passwordInputVisibility = false;
  }

  @override
  void dispose() {
    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();
  }
}
