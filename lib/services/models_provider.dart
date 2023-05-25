import 'package:flash_chat/services/gpt_service.dart';
import 'package:flutter/cupertino.dart';

import '../components/models.dart';

class ModelsProvider with ChangeNotifier{
  String currentModel = "text-davinci-003";
  List<Model> modelsList = [];

  List<Model> get getModelsList{
    return modelsList;
  }

  String get getCurrentModel{
    return currentModel;
  }

  void setCurrentModel(String newModel){
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<Model>> getAllModels() async{
    modelsList = await GptService.getModels();
    return modelsList;
  }
}