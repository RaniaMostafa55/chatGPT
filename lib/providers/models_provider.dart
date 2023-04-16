import 'package:chat_gpt_app/models/models_model.dart';
import 'package:chat_gpt_app/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelsProvider extends ChangeNotifier {
  String currentModel = "text-davinci-003";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];
  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}
