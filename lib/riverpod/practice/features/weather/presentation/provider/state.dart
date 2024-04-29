import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/weather/application/weather_service.dart';
import 'package:food_ui/riverpod/practice/features/weather/domain/weather_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final weatherStateProvider = Provider<WeatherState>((ref) {
  return WeatherState(ref);
});

class WeatherState {
  final Ref ref;
  WeatherState(this.ref);
  //junjun data modidfy garnu pardaina tyeslai controller banaunupardaina
//future provider matra banaye hunxa.

  final queryTextProvider = Provider<TextEditingController>((ref) {
    return TextEditingController(text: "Kathmandu");
  });

//FUTURE PROVIDER
  late final currentWeatherFutureProvider =
      FutureProvider<WeatherModel>((ref) async {
    //await garyo bhane future ko datatype return hunxa
    //garena bhane future return hunxa
    //future return garnu paro so repositpry banako
    //service use garea state batapani communicate garnu milo data sanga.
    //yo future providerma controller na chainey bhayera state bata service bolako.

    final client = await ref.handleDebounceAndCancel();

    final weatherRepository =
        ref.read(weatherServiceProvider).weatherRepository;
    return weatherRepository.currentWeather(
        query: ref.read(queryTextProvider).text, localClient: client);
  });

  refreshCurrentWeather() {
    if (ref.read(queryTextProvider).text.isNotEmpty) {
      ref.refresh(currentWeatherFutureProvider);
    }
  }
}

//Extension banako.
extension HandleDebounceAndCancel on Ref {
  Future<http.Client> handleDebounceAndCancel() async {
    var dispose = false;
    onDispose(() {
      dispose = true;
    });

    //dispose ko value true ho ki nai check garnu kureko 1 second yo casema
    //dispose bhaxa bhane throw gareko ani riverpodle catch gardiyo ani
    //tala client ni banena current weather ni call bhayena
    //dispose bhako xaina raexa bhaney naya client banako.

    await Future.delayed(const Duration(seconds: 1));
    if (dispose) {
      throw "Cancel";
    }
    final client = http.Client();
    onDispose(() {
      //request cancel ni garxa yesle
      client.close();
    });
    return client;
  }
}
