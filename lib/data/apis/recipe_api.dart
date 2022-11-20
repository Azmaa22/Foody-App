import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_apis/data/models/recipe_model.dart';
import 'package:flutter_apis/helpers/dio_helper.dart';
import 'package:flutter_apis/utilities/constants/api_keys_constants.dart';

class RecipeApi {
  static Future<List<dynamic>> getAllRecipe(
      {String typeOfRecipe = 'salad'}) async {
    Response response = await DioHelper.getHttp(
        url:
            '?type=public&q=$typeOfRecipe&app_id=$applicationId&app_key=$apiKey');

    if (response.statusCode == 200) {
      return response.data['hits'];
    } else {
      return [];
    }
  }
}
