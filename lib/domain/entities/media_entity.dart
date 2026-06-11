import 'package:equatable/equatable.dart';

enum MediaType { video, image }

class MediaEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final MediaType type;
  final String localPath;
  final String remotePath;
  final int displayDuration;
  final int order;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? scheduledEndDate;
  final int? fileSize;

  const MediaEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.localPath,
    required this.remotePath,
    required this.displayDuration,
    required this.order,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.scheduledEndDate,
    this.fileSize,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    type,
    localPath,
    remotePath,
    displayDuration,
    order,
    isActive,
    createdAt,
    updatedAt,
    scheduledEndDate,
    fileSize,
  ];

  MediaEntity copyWith({
    String? id,
    String? title,
    String? description,
    MediaType? type,
    String? localPath,
    String? remotePath,
    int? displayDuration,
    int? order,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? scheduledEndDate,
    int? fileSize,
  }) {
    return MediaEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      localPath: localPath ?? this.localPath,
      remotePath: remotePath ?? this.remotePath,
      displayDuration: displayDuration ?? this.displayDuration,
      order: order ?? this.order,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      scheduledEndDate: scheduledEndDate ?? this.scheduledEndDate,
      fileSize: fileSize ?? this.fileSize,
    );
  }
}
