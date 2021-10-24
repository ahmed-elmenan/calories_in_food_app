import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fapp/features/supplements/data/datasources/supplement_remote_data_source.dart';
import 'package:fapp/features/supplements/domain/entities/protein_supplement.dart';
import 'package:fapp/features/supplements/domain/repositories/supplements_repository.dart';
import 'package:get_it/get_it.dart';

import 'core/network/networkInfo.dart';
import 'features/supplements/data/repositories/supplement_repository_impl.dart';
import 'features/supplements/domain/usecases/get_protein_supplement.dart';

final sl = GetIt.instance;

Future<void> init() {
  //! Features - Number Supplements
  // Use Cases
  sl.registerLazySingleton(() => GetProteinSupplement(sl()));

  // Repository
  sl.registerLazySingleton<SupplementRepository>(() =>
      SupplementRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  //Data
  sl.registerLazySingleton<SupplementRemoteDataSource>(
      () => SupplementRemoteDataSourceImpl(firestore: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
