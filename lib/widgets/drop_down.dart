import 'package:chatgbt_4/providers/model_provider.dart';
import 'package:chatgbt_4/services/api.dart';
import 'package:chatgbt_4/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({super.key});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String? current;
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);
    current = modelProvider.getCurrentModel;

    return FutureBuilder(
      future: modelProvider.getAllModels(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('There is an error'),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const FittedBox(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 30,
              ),
            );
          }
          return snapshot.data!.isEmpty
              ? FittedBox(
                  child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    items: List.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                        value: snapshot.data![index].id,
                        child: TextWidget(
                          label: snapshot.data![index].id,
                        ),
                      ),
                    ),
                    onChanged: ((value) {
                      setState(() {
                        current = value.toString();
                      });
                      modelProvider.setCurrentModel(value.toString());
                    }),
                  ),
                )
              : const SizedBox.shrink();
        }
      }),
    );
  }
}
// *




//*
