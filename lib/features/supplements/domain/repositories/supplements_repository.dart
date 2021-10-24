import 'package:dartz/dartz.dart';
import 'package:fapp/core/error/failure.dart';
import 'package:fapp/features/supplements/domain/entities/protein_supplement.dart';

abstract class SupplementRepository {
  Future<Either<Failure, ProteinSupplement>> getProteinSupplement(String productName);
}