import 'package:weather_app_open_weather_api/core/either.dart';
import 'package:weather_app_open_weather_api/core/failure.dart';
import 'package:weather_app_open_weather_api/core/use_case.dart';
import 'package:weather_app_open_weather_api/domain/entities/city.dart';
import 'package:weather_app_open_weather_api/domain/repos/city_repo.dart';
import 'package:riverpod/riverpod.dart';

class GetCity implements UseCase<City, NoParams> {
  const GetCity(this.repo);

  final CityRepo repo;

  @override
  Future<Either<Failure, City>> call(NoParams params) => repo.getCity();
}

final getCityProvider = Provider((ref) => GetCity(ref.watch(cityRepoProvider)));
