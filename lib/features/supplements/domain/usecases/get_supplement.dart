import 'package:fapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fapp/core/usecases/usecase.dart';
import 'package:fapp/features/supplements/domain/entities/supplement.dart';
import 'package:fapp/features/supplements/domain/repositories/supplements_repository.dart';

class GetSupplement implements UseCase<Supplement, Params>{
  final SupplementRepository repository;

  GetSupplement(this.repository);

  @override
  Future<Either<Failure, Supplement>> call(Params params) async {
    return await repository.getSupplement(params.name);
  }
}

class Params {
  final String name;

  Params({this.name});
}
