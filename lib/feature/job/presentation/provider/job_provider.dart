import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nexo/feature/job/di/job_providers.dart';
import 'package:nexo/feature/job/domain/repository/job_repository.dart';
import 'package:nexo/feature/job/domain/model/job.dart';

// Async, Notifier-based controller mirroring the style used by
// AuthController (lib/feature/login/presentation/controller/auth_controller.dart),
// adapted to AsyncNotifier since job data is fetched asynchronously.
class JobListController extends AsyncNotifier<List<Job>> {
  IJobRepository get _jobRepository => ref.read(jobRepositoryProvider);

  @override
  Future<List<Job>> build() {
    return _jobRepository.getJobs();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _jobRepository.getJobs());
  }
}

final jobListProvider = AsyncNotifierProvider<JobListController, List<Job>>(() {
  return JobListController();
});
