import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nexo/feature/job/data/repository/job_repository_impl.dart';
import 'package:nexo/feature/job/domain/repository/job_repository.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final jobRepositoryProvider = Provider<IJobRepository>(
  (ref) => JobRepositoryImpl(ref.watch(firebaseFirestoreProvider)),
);
