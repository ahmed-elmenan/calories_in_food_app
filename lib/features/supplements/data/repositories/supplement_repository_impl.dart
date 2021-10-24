import 'package:fapp/core/error/exceptions.dart';
import 'package:fapp/core/network/networkInfo.dart';
import 'package:fapp/features/supplements/data/datasources/supplement_remote_data_source.dart';
import 'package:fapp/features/supplements/domain/entities/protein_supplement.dart';
import 'package:fapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fapp/features/supplements/domain/repositories/supplements_repository.dart';
import 'package:meta/meta.dart';

class SupplementRepositoryImpl implements SupplementRepository {
  final SupplementRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SupplementRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, ProteinSupplement>> getProteinSupplement(
      String productName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProtein =
            await remoteDataSource.getProteinSupplement(productName);
        return Right(remoteProtein);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
