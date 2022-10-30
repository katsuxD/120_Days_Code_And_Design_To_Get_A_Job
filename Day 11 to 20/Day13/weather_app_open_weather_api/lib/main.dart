import 'package:weather_app_open_weather_api/data/models/dark_theme_model.dart';
import 'package:weather_app_open_weather_api/data/models/theme_model.dart';
import 'package:weather_app_open_weather_api/data/provider.dart';
import 'package:weather_app_open_weather_api/data/repos/city_repo_impl.dart';
import 'package:weather_app_open_weather_api/data/repos/full_weather_repo.dart';
import 'package:weather_app_open_weather_api/data/repos/unit_system_repo_impl.dart';
import 'package:weather_app_open_weather_api/domain/repos/city_repo.dart';
import 'package:weather_app_open_weather_api/domain/repos/full_weather_repo.dart';
import 'package:weather_app_open_weather_api/domain/repos/unit_system_repo.dart';
import 'package:weather_app_open_weather_api/ui/screens/weather_screen.dart';
import 'package:weather_app_open_weather_api/ui/state_notifiers/theme_state_notifier.dart'
    as t;
import 'package:weather_app_open_weather_api/ui/state_notifiers/theme_state_notifier.dart'
    show themeStateNotifierProvider;
import 'package:weather_app_open_weather_api/ui/themes/black_theme.dart';
import 'package:weather_app_open_weather_api/ui/themes/dark_theme.dart';
import 'package:weather_app_open_weather_api/ui/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'ui/build_flavor.dart';
import 'ui/themes/clima_theme.dart';

Future<void> main({
  TransitionBuilder? builder,
  Widget Function(Widget widget)? topLevelBuilder,
  Locale? Function(BuildContext)? getLocale,
}) async {
  // Unless you do this, using method channels (like `SharedPreferences` does)
  // before running `runApp` throws an error.
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final widget = ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      cityRepoProvider.overrideWithProvider(
        Provider((ref) => ref.watch(cityRepoImplProvider)),
      ),
      unitSystemRepoProvider.overrideWithProvider(
        Provider((ref) => ref.watch(unitSystemRepoImplProvider)),
      ),
      fullWeatherRepoProvider.overrideWithProvider(
        Provider((ref) => ref.watch(fullWeatherRepoImplProvider)),
      ),
    ],
    child: _App(builder: builder, getLocale: getLocale),
  );

  runApp(topLevelBuilder?.call(widget) ?? widget);
}

class _App extends HookConsumerWidget {
  const _App({this.builder, this.getLocale});

  final TransitionBuilder? builder;

  final Locale? Function(BuildContext)? getLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    validateBuildFlavor();

    final themeStateNotifier = ref.watch(themeStateNotifierProvider.notifier);

    useEffect(
      () {
        themeStateNotifier.loadTheme();

        return null;
      },
      [themeStateNotifier],
    );

    final themeState = ref.watch(themeStateNotifierProvider);

    if (themeState is t.EmptyState || themeState is t.Loading) {
      return const SizedBox.shrink();
    }

    return Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        locale: getLocale?.call(context),
        builder: (context, child) {
          final ClimaThemeData climateTheme;

          switch (Theme.of(context).brightness) {
            case Brightness.light:
              climateTheme = lightClimaTheme;
              break;

            case Brightness.dark:
              climateTheme = {
                DarkThemeModel.black: blackClimaTheme,
                DarkThemeModel.darkGrey: darkGreyClimaTheme,
              }[themeState.darkTheme]!;
          }

          child = ClimaTheme(data: climateTheme, child: child!);

          return builder?.call(context, child) ?? child;
        },
        home: const WeatherScreen(),
        theme: lightTheme,
        darkTheme: {
          DarkThemeModel.black: blackTheme,
          DarkThemeModel.darkGrey: darkGreyTheme,
        }[themeState.darkTheme],
        themeMode: const {
          ThemeModel.systemDefault: ThemeMode.system,
          ThemeModel.light: ThemeMode.light,
          ThemeModel.dark: ThemeMode.dark,
        }[themeState.theme],
      ),
    );
  }
}
