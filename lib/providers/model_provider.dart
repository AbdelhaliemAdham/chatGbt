import 'package:chatgbt_4/models/models_model.dart';
import 'package:chatgbt_4/services/api.dart';
import 'package:flutter/material.dart';

class ModelProvider with ChangeNotifier {
  List<ModelsModel> list = [];

  List<ModelsModel> get getModelList => list;
  String get getCurrentModel => currentModel;

  String currentModel = 'text-devinci-003';

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels() async {
    list = await Api.getModels();
    return list;
  }
}
