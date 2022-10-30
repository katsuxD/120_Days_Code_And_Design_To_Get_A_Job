import 'package:weather_app_open_weather_api/core/either.dart';
import 'package:weather_app_open_weather_api/core/failure.dart';
import 'package:weather_app_open_weather_api/domain/entities/unit_system.dart';
import 'package:riverpod/riverpod.dart';

abstract class UnitSystemRepo {
  Future<Either<Failure, UnitSystem>> getUnitSystem();

  Future<Either<Failure, void>> setUnitSystem(UnitSystem unitSystem);
}

final unitSystemRepoProvider =
    Provider<UnitSystemRepo>((ref) => throw UnimplementedError());
