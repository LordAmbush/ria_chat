import 'package:flash_chat/screens/gpt_screen.dart';
import 'package:flash_chat/services/gpt_service.dart';
import 'package:flash_chat/services/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../services/models_provider.dart';
import '../services/models_provider.dart';
import 'models.dart';

class DropDown extends StatefulWidget {
  const DropDown();

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context,listen: false);
    return FutureBuilder<List<Model>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          else if(snapshot.data == null){
            return SizedBox();
          }else{
            return FittedBox(
              child: DropdownButton(
                  iconEnabledColor: Colors.white,
                  dropdownColor: gptCardColor,
                  items: List<DropdownMenuItem<String>>.generate(snapshot.data != null ? snapshot.data.length : 0, (index) => DropdownMenuItem(
                value: snapshot.data != null ? snapshot.data[index].id : "",
                child: Text(snapshot.data != null ? snapshot.data[index].id : "",
                  style: TextStyle(color:  Colors.white),
                ),
              ),
              ),
                  value: modelsProvider.currentModel,
                  onChanged: (value){
                    setState(() {
                      modelsProvider.setCurrentModel(value.toString());
                    });
                  },
              ),
            );}
        });
  }
}
