import 'dart:async';

import 'package:food_ui/riverpod/practice/features/weather/domain/api_error_model.dart';
import 'package:food_ui/riverpod/practice/features/weather/domain/weather_model.dart';
import 'package:http/http.dart' as http;

//external source bhanera apiUrl banakoxa which is data source.
//currentWeather fetch gareko
//source ko condition follow gareko.
//DTO ra datasources ko main middle man ho yo Repositores. external sources sanga kura garxa yesle.

//alias diyera bhitrako content xuttaxuttae load garna milxa
class WeatherRepository {
  final String key = "09c32d9641344bababf91956230612";
  final client = http.Client();
  final apiUrl = "https://api.weatherapi.com/v1/";
  //key ko value yai deko xa tyae bhayera constructor ma kei nahaleko
  WeatherRepository();

//current bhanne endpoint bata json data leko bhayera current.json lekheko
  Future<WeatherModel> currentWeather(
      {required String query, http.Client? localClient}) async {
    try {
      final response = await (localClient ?? client).get(
        Uri.parse("${apiUrl}current.json?key=$key&q=$query"),
      );

      if (response.statusCode == 200) {
        //success
        //response lai decode garera lera ayepaxi
        //weather model ko instance banaunu paro
        final currentWeather = WeatherModel.fromRawJson(response.body);
        return currentWeather;
      } else {
        //fail/error wala
        //api error model ko instance banaunu paro
        final apiError = ApiErrorModel.fromRawJson(response.body);

        //throw garepaci tryko catch bhanne block ma janxa
        //error object matra throw garxa.
        //message text catch ko e ma ayera basxa.

        //try bata ako error kati lamo hunxa ani hamile override garera hamro message throw gardeko.
        throw apiError.error.message;
      }
    }
    // on SocketException {
    //   //internet chalena bhane, connection error
    // }
    // on TimeoutException{
    //   //serverle response time ma dinu sakena bhaney
    // }
    catch (e) {
      //try ma run gaera error ayo bhane catch le handle garxa
      //catch ko first parameter error object hunxa, second parameter stack trace.
      //stack trace = hamro error auda side ma line number dekhauxa, ka error ako xa bhandinxa. middle man jasto
      //error object = kina error bhako, ani error type

      //nested try catch xa bhane parent ja xa tya suruma handle hunxa
      //first ma yo method ko try catch chalxa hamile yo method ui tira bata call gaera try catch lekhyo bhanepani
      //ani rethrow garxa. tyo garepaxi ui try catch ma pathaidinxa
      //rethrow bina arko thauma banako trycatch chaldaina

      //future provider le catch garekoxa FutureProvider use gareko bela
      print(e);
      rethrow;
    }
    // finally {
    //   //try garera catch ma ayepani na ayepani yo section run hunxa
    //   throw "";
    // }
  }
}
