import 'package:fapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fapp/core/usecases/usecase.dart';
import 'package:fapp/features/supplements/domain/entities/protein_supplement.dart';
import 'package:fapp/features/supplements/domain/repositories/supplements_repository.dart';

class GetProteinSupplement implements UseCase<ProteinSupplement, Params>{
  final SupplementRepository repository;

  GetProteinSupplement(this.repository);

  @override
  Future<Either<Failure, ProteinSupplement>> call(Params params) async {
    return await repository.getProteinSupplement(params.productName);
  }
}

class Params {
  final String productName;

  Params({this.productName});
}
