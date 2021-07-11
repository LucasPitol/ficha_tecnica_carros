import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/auto.dart';

import 'auto_service.dart';

class LocalStorageService {
  AutoService _autoService;

  LocalStorageService() {
    this._autoService = AutoService();
  }

  Future<void> saveAsFavorite(String autoId) async {
    final prefs = await SharedPreferences.getInstance();

    bool alreadySaved = prefs.containsKey(autoId);

    if (!alreadySaved) {
      String savedAt = (DateTime.now()).toIso8601String();

      await prefs.setString(autoId, savedAt);
    }
  }

  Future<void> clearSavedAutoAsFavorite(String autoId) async {
    final prefs = await SharedPreferences.getInstance();

    bool alreadySaved = prefs.containsKey(autoId);

    if (alreadySaved) {
      await prefs.remove(autoId);
    }
  }

  Future<bool> isAlreadySaved(String autoId) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(autoId);
  }

  Future<ResponseDto> getFavoriteAutos() async {
    ResponseDto res = ResponseDto();
    List<Auto> autos = [];

    final prefs = await SharedPreferences.getInstance();

    List<String> keys = (prefs.getKeys()).toList();

    if (keys.isNotEmpty) {
      autos = (await this._autoService.getByIds(keys)).data;
    }

    res.success = true;
    res.data = autos;

    return res;
  }
}
