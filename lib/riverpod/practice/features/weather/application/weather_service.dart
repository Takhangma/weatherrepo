import 'package:food_ui/riverpod/practice/features/weather/data/weather_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final weatherServiceProvider = Provider<WeatherService>(
  (ref) {
    return WeatherService(ref);
  },
);

class WeatherService {
  final Ref ref;
  final WeatherRepository weatherRepository = WeatherRepository();
  WeatherService(this.ref);
}
