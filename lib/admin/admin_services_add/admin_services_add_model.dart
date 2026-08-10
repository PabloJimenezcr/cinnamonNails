import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_services_add_widget.dart' show AdminServicesAddWidget;
import 'package:flutter/material.dart';

class AdminServicesAddModel extends FlutterFlowModel<AdminServicesAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ServiceNameInput widget.
  FocusNode? serviceNameInputFocusNode;
  TextEditingController? serviceNameInputTextController;
  String? Function(BuildContext, String?)?
      serviceNameInputTextControllerValidator;
  // State field(s) for ServiceDescriptionInput widget.
  FocusNode? serviceDescriptionInputFocusNode;
  TextEditingController? serviceDescriptionInputTextController;
  String? Function(BuildContext, String?)?
      serviceDescriptionInputTextControllerValidator;
  // State field(s) for ImageUrlInput widget.
  FocusNode? imageUrlInputFocusNode;
  TextEditingController? imageUrlInputTextController;
  String? Function(BuildContext, String?)? imageUrlInputTextControllerValidator;
  // State field(s) for ServiceCategoryDropDown widget.
  String? serviceCategoryDropDownValue;
  FormFieldController<String>? serviceCategoryDropDownValueController;
  // State field(s) for ServicePriceInput widget.
  FocusNode? servicePriceInputFocusNode;
  TextEditingController? servicePriceInputTextController;
  String? Function(BuildContext, String?)?
      servicePriceInputTextControllerValidator;
  // State field(s) for ServiceDurationInput widget.
  FocusNode? serviceDurationInputFocusNode;
  TextEditingController? serviceDurationInputTextController;
  String? Function(BuildContext, String?)?
      serviceDurationInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serviceNameInputFocusNode?.dispose();
    serviceNameInputTextController?.dispose();

    serviceDescriptionInputFocusNode?.dispose();
    serviceDescriptionInputTextController?.dispose();

    imageUrlInputFocusNode?.dispose();
    imageUrlInputTextController?.dispose();

    servicePriceInputFocusNode?.dispose();
    servicePriceInputTextController?.dispose();

    serviceDurationInputFocusNode?.dispose();
    serviceDurationInputTextController?.dispose();
  }
}
