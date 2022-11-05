import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_controls.dart';
import 'package:flutter_starter/ui/views/sample_form/sample_form_view_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SampleFormView extends ViewModelBuilderWidget<SampleFormModel>{
  const SampleFormView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SampleFormModel viewModel, Widget? child){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample form'),
      ),
      body: SingleChildScrollView(
        child: ReactiveForm(
            formGroup: viewModel.formGroup,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                //Name
                ReactiveTextField(
                  formControlName: SampleFormControls.name,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Date of Birth
                ReactiveTextField(
                    formControlName: SampleFormControls.dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        hintText: "Date Of Birth"),
                    onTap: (value) {
                      viewModel.selectDate(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                //Gender
                ReactiveDropdownField<String>(
                  formControlName: SampleFormControls.gender,
                  hint: const Text('Select Gender'),
                  items: const [
                    DropdownMenuItem(
                      value: "male",
                      child: Text('male'),
                    ),
                    DropdownMenuItem(
                      value: "female",
                      child: Text('female'),
                    ),
                  ],
                  onChanged: (_) {
                    // viewModel.changeCallType();
                  },
                ),
              ],
            )
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) =>SampleFormModel();

  @override
  void onViewModelReady(SampleFormModel viewModel) => viewModel.init();
}