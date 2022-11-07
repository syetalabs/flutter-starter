import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_controls.dart';
import 'package:stacked/stacked.dart';
import 'package:reactive_forms/reactive_forms.dart' as rf;

class SampleFormModel extends BaseViewModel{

  final formGroup = rf.FormGroup({
    SampleFormControls.name : rf.FormControl<String>(validators: [rf.Validators.required]),
    SampleFormControls.dateOfBirth: rf.FormControl<DateTime>(),
    SampleFormControls.gender: rf.FormControl<String>(),
    SampleFormControls.phoneNumber: rf.FormControl<String>(validators: [rf.Validators.required]),
    SampleFormControls.email: rf.FormControl<String>(validators: [rf.Validators.required]),
  });

  void selectDate(BuildContext context) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    debugPrint(date!.toIso8601String());
    formGroup.control(SampleFormControls.dateOfBirth).value = date;
  }



  init() {}
}