import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class Job {
  final String id;
  final String title;
  final String company;
  final String logo;
  final String location;
  final String salary;
  final String type;
  final List<String> tags;
  final bool isRemote;
  final bool isFeatured;
  final String datePosted;

  const Job({
    this.id = '',
    required this.title,
    required this.company,
    this.logo = '',
    required this.location,
    required this.salary,
    required this.type,
    this.tags = const [],
    this.isRemote = false,
    this.isFeatured = false,
    this.datePosted = '',
  });

  Job copyWith({
    String? id,
    String? title,
    String? company,
    String? logo,
    String? location,
    String? salary,
    String? type,
    List<String>? tags,
    bool? isRemote,
    bool? isFeatured,
    String? datePosted,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      logo: logo ?? this.logo,
      location: location ?? this.location,
      salary: salary ?? this.salary,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      isRemote: isRemote ?? this.isRemote,
      isFeatured: isFeatured ?? this.isFeatured,
      datePosted: datePosted ?? this.datePosted,
    );
  }

  // Factory constructor to safely create from a Firestore document.
  factory Job.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return Job.fromMap(data, id: doc.id);
  }

  // Factory constructor for plain maps (Firestore data or demo/seed data).
  factory Job.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return Job(
      id: id,
      title: map['title'] as String? ?? 'Job Title',
      company: map['company'] as String? ?? 'Company',
      logo: map['logo'] as String? ?? '',
      location: map['location'] as String? ?? 'Location',
      salary: map['salary'] as String? ?? 'Competitive',
      type: map['type'] as String? ?? 'Full-time',
      tags: (map['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
      isRemote: map['isRemote'] as bool? ?? false,
      isFeatured: map['isFeatured'] as bool? ?? false,
      datePosted: map['datePosted'] as String? ?? '',
    );
  }

  // Map used both to write to Firestore and to hand to JobDetailScreen,
  // which still consumes a Map<String, dynamic>.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'company': company,
      'logo': logo,
      'location': location,
      'salary': salary,
      'type': type,
      'tags': tags,
      'isRemote': isRemote,
      'isFeatured': isFeatured,
      'datePosted': datePosted,
    };
  }
}
