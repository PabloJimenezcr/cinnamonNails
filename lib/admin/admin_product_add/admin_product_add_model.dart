import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_product_add_widget.dart' show AdminProductAddWidget;
import 'package:flutter/material.dart';

class AdminProductAddModel extends FlutterFlowModel<AdminProductAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ProductNameInput widget.
  FocusNode? productNameInputFocusNode;
  TextEditingController? productNameInputTextController;
  String? Function(BuildContext, String?)?
      productNameInputTextControllerValidator;
  // State field(s) for ImageURLInput widget.
  FocusNode? imageURLInputFocusNode;
  TextEditingController? imageURLInputTextController;
  String? Function(BuildContext, String?)? imageURLInputTextControllerValidator;
  // State field(s) for ProductDescriptionInput widget.
  FocusNode? productDescriptionInputFocusNode;
  TextEditingController? productDescriptionInputTextController;
  String? Function(BuildContext, String?)?
      productDescriptionInputTextControllerValidator;
  // State field(s) for ProductCategoryDropDown widget.
  String? productCategoryDropDownValue;
  FormFieldController<String>? productCategoryDropDownValueController;
  // State field(s) for ProductBrandInput widget.
  FocusNode? productBrandInputFocusNode;
  TextEditingController? productBrandInputTextController;
  String? Function(BuildContext, String?)?
      productBrandInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameInputFocusNode?.dispose();
    productNameInputTextController?.dispose();

    imageURLInputFocusNode?.dispose();
    imageURLInputTextController?.dispose();

    productDescriptionInputFocusNode?.dispose();
    productDescriptionInputTextController?.dispose();

    productBrandInputFocusNode?.dispose();
    productBrandInputTextController?.dispose();
  }
}
