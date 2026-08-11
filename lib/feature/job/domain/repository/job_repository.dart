import 'package:nexo/feature/job/domain/model/job.dart';

abstract class IJobRepository {
  Future<List<Job>> getJobs();

  // Dev-only: pushes the bundled demo jobs into Firestore as a starting
  // dataset. Call once, then edit/replace docs in the Firebase Console.
  Future<void> seedDemoJobs();
}
