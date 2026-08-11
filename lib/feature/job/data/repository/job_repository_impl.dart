import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:nexo/feature/job/domain/model/job.dart';
import 'package:nexo/feature/job/domain/repository/job_repository.dart';
import '../data_source/seed/job_seed_data.dart';

class JobRepositoryImpl implements IJobRepository {
  final FirebaseFirestore _firestore;

  JobRepositoryImpl(this._firestore);

  static const String _collectionPath = 'jobs';

  @override
  // Fetches jobs from Firestore. If the collection is empty (nothing has
  // been seeded into the backend yet), falls back to the bundled demo data
  // so the screen is never left blank.
  Future<List<Job>> getJobs() async {
    try {
      final snapshot = await _firestore
          .collection(_collectionPath)
          .get()
          .timeout(const Duration(seconds: 8));

      if (snapshot.docs.isEmpty) {
        debugPrint(
          '[JobRepositoryImpl] Firestore `jobs` collection is empty — '
          'falling back to demo data. This is placeholder data, not live data.',
        );
        return demoJobs;
      }

      return snapshot.docs.map((doc) => Job.fromFirestore(doc)).toList();
    } catch (e) {
      debugPrint(
        '[JobRepositoryImpl] Failed to fetch jobs from Firestore ($e) — '
        'falling back to demo data. This is placeholder data, not live data.',
      );
      return demoJobs;
    }
  }

  @override
  Future<void> seedDemoJobs() async {
    final batch = _firestore.batch();
    final collection = _firestore.collection(_collectionPath);
    for (final job in demoJobs) {
      batch.set(collection.doc(), job.toMap());
    }
    await batch.commit();
    debugPrint('[JobRepositoryImpl] Seeded ${demoJobs.length} demo jobs into Firestore.');
  }
}
