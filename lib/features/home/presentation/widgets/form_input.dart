import 'package:flutter/material.dart';
import 'package:lovecalculation/cores/utils/validation.dart';
import 'package:lovecalculation/cores/widgets/custom_textfield.dart';
import 'package:lovecalculation/features/home/presentation/providers/home_provider.dart';
import 'package:lovecalculation/features/home/presentation/widgets/love.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../cores/utils/enums.dart';
import '../../../../cores/widgets/custom_button_widget.dart';

class LoveFormWidget extends StatefulWidget {
  const LoveFormWidget({super.key});

  @override
  State<LoveFormWidget> createState() => _LoveFormWidgetState();
}

class _LoveFormWidgetState extends State<LoveFormWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: provider.yourName,
            title: 'Your name',
            fieldValidator: ValidationHelper(
              isError: (bool value) => provider.setYourNameError = value,
              typeField: TypeField.yourName,
            ).validate(),
          ),
          SizedBox(
            height: 3.pt,
          ),
          const Icon(
            Icons.add,
            size: 50,
          ),
          SizedBox(
            height: 3.pt,
          ),
          CustomTextField(
            controller: provider.hisName,
            title: 'His name',
            fieldValidator: ValidationHelper(
              isError: (bool value) => provider.setHisnameError = value,
              typeField: TypeField.hisName,
            ).validate(),
          ),
          SizedBox(
            height: 5.pt,
          ),
          CustomButton(
            bgColor: Colors.redAccent,
            event: () {
              if (provider.formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: SingleChildScrollView(
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: LoveDialogWidget(
                                      yourname: '${provider.yourName.text}',
                                      hisname: '${provider.hisName.text}'),
                                ),
                                Positioned(
                                  right: 0.0,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ));
                    });
              }
            },
            text: const Text(
              'Calculate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
