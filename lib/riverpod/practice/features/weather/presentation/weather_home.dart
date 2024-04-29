import 'package:flutter/material.dart';
import 'package:food_ui/riverpod/practice/features/weather/presentation/provider/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherHome extends ConsumerWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.read(weatherStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () =>
            //currentWeather bhanne refetch garxa.
            //refresh sanga matra .future lekhnu parxa.
            ref.refresh(weatherState.currentWeatherFutureProvider.future),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextField(
                  controller: ref.read(weatherState.queryTextProvider),
                  onSubmitted: (value) {
                    // ref.refresh(weatherService.currentWeatherFutureProvider);
                    weatherState.refreshCurrentWeather();
                  },
                  onChanged: (String value) {
                    //print(value);

                    weatherState.refreshCurrentWeather();
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer(
                  builder: (context, ref, child) {
                    //futureProvider ko datatype AsyncValue hunxa
                    final currentWeather =
                        ref.watch(weatherState.currentWeatherFutureProvider);
                    return currentWeather.when(
                      data: (currentModel) => Column(
                        children: [
                          Text("Location Name: ${currentModel.location.name} "),
                          Text("Temperature: ${currentModel.current.tempC}°C"),
                        ],
                      ),
                      error: (e, s) => Text("$e"),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
