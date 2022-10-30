import 'package:weather_app_open_weather_api/ui/state_notifiers/full_weather_state_notifier.dart'
    as w;
import 'package:weather_app_open_weather_api/ui/utilities/constants.dart';
import 'package:weather_app_open_weather_api/ui/utilities/weather_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DailyForecastsWidget extends ConsumerWidget {
  const DailyForecastsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyForecasts = ref.watch(
      w.fullWeatherStateNotifierProvider.select(
        (state) => state.fullWeather!.dailyForecasts,
      ),
    );
    final timeZoneOffset = ref.watch(
      w.fullWeatherStateNotifierProvider.select(
        (state) => state.fullWeather!.timeZoneOffset,
      ),
    );
    final currentDayForecast = ref.watch(
      w.fullWeatherStateNotifierProvider.select(
        (state) => state.fullWeather!.currentDayForecast,
      ),
    );

    return Column(
      children: [
        for (final dailyForecast in dailyForecasts)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    dailyForecast == currentDayForecast
                        ? 'Today'
                        : DateFormat.EEEE().format(
                            dailyForecast.date.toUtc().add(timeZoneOffset),
                          ),
                    style: kSubtitle1TextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        getWeatherIcon(dailyForecast.iconCode),
                        height: 6.h,
                      ),
                      Icon(
                        FontAwesomeIcons.droplet,
                        color: Theme.of(context).textTheme.subtitle2!.color,
                        size: kIconSize(context),
                      ),
                      Text(
                        '${(dailyForecast.pop * 100).round()}%',
                        style: kSubtitle2TextStyle(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${dailyForecast.maxTemperature.round()}°',
                        style: kSubtitle1TextStyle(context),
                      ),
                      Text(
                        '/',
                        style: kSubtitle2TextStyle(context),
                      ),
                      Text(
                        '${dailyForecast.minTemperature.round()}°',
                        style: kSubtitle2TextStyle(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
