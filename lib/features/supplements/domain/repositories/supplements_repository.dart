import 'package:dartz/dartz.dart';
import 'package:fapp/core/error/failure.dart';
import 'package:fapp/features/supplements/domain/entities/supplement.dart';

abstract class SupplementRepository {
  Future<Either<Failure, Supplement>> getSupplement(String name);
}