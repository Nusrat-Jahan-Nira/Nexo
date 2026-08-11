import 'package:flutter/material.dart';

@immutable
class JobFilterState {
  final List<String> selectedJobTypes;
  final List<String> selectedExperienceLevels;
  final RangeValues salaryRange;
  final bool remoteOnly;

  const JobFilterState({
    this.selectedJobTypes = const [],
    this.selectedExperienceLevels = const [],
    this.salaryRange = const RangeValues(40000, 160000),
    this.remoteOnly = false,
  });

  JobFilterState copyWith({
    List<String>? selectedJobTypes,
    List<String>? selectedExperienceLevels,
    RangeValues? salaryRange,
    bool? remoteOnly,
  }) {
    return JobFilterState(
      selectedJobTypes: selectedJobTypes ?? this.selectedJobTypes,
      selectedExperienceLevels: selectedExperienceLevels ?? this.selectedExperienceLevels,
      salaryRange: salaryRange ?? this.salaryRange,
      remoteOnly: remoteOnly ?? this.remoteOnly,
    );
  }

  static const JobFilterState initial = JobFilterState();
}
