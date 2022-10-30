import 'package:weather_app_open_weather_api/core/either.dart';
import 'package:weather_app_open_weather_api/core/failure.dart';
import 'package:weather_app_open_weather_api/data/models/unit_system_model.dart';
import 'package:weather_app_open_weather_api/data/provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefsKey = 'unit_system';

class UnitSystemLocalDataSource {
  UnitSystemLocalDataSource(this._prefs);

  final SharedPreferences _prefs;

  Future<Either<Failure, UnitSystemModel?>> getUnitSystem() async {
    final string = _prefs.getString(_prefsKey);

    if (string == null) return const Right(null);

    return Right(UnitSystemModel.parse(string));
  }

  Future<Either<Failure, void>> setUnitSystem(UnitSystemModel model) async {
    await _prefs.setString(_prefsKey, model.toString());

    return const Right(null);
  }
}

final unitSystemLocalDataSourceProvider = Provider(
  (ref) => UnitSystemLocalDataSource(ref.watch(sharedPreferencesProvider)),
);
