import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre completo es obligatorio';
    }

    return null;
  }

  // State field(s) for emailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  String? _emailInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es obligatorio.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresa un correo electrónico válido.';
    }
    return null;
  }

  // State field(s) for phoneInput widget.
  FocusNode? phoneInputFocusNode;
  TextEditingController? phoneInputTextController;
  String? Function(BuildContext, String?)? phoneInputTextControllerValidator;
  String? _phoneInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de teléfono es obligatorio.';
    }

    if (val.length < 8) {
      return 'Teléfono no válido';
    }

    return null;
  }

  // State field(s) for passwordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  String? _passwordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es obligatoria.';
    }

    if (val.length < 7) {
      return 'La contraseña debe tener al menos 7 caracteres.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
    emailInputTextControllerValidator = _emailInputTextControllerValidator;
    phoneInputTextControllerValidator = _phoneInputTextControllerValidator;
    passwordInputVisibility = false;
    passwordInputTextControllerValidator =
        _passwordInputTextControllerValidator;
  }

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    phoneInputFocusNode?.dispose();
    phoneInputTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();
  }
}
