import '../entities/media_entity.dart';

class MediaModel extends MediaEntity {
  const MediaModel({
    required String id,
    required String title,
    required String description,
    required MediaType type,
    required String localPath,
    required String remotePath,
    required int displayDuration,
    required int order,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? scheduledEndDate,
    int? fileSize,
  }) : super(
    id: id,
    title: title,
    description: description,
    type: type,
    localPath: localPath,
    remotePath: remotePath,
    displayDuration: displayDuration,
    order: order,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
    scheduledEndDate: scheduledEndDate,
    fileSize: fileSize,
  );

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: MediaType.values.byName(json['type'] as String),
      localPath: json['localPath'] as String? ?? '',
      remotePath: json['remotePath'] as String,
      displayDuration: json['displayDuration'] as int,
      order: json['order'] as int,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      scheduledEndDate: json['scheduledEndDate'] != null
          ? DateTime.parse(json['scheduledEndDate'] as String)
          : null,
      fileSize: json['fileSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'localPath': localPath,
      'remotePath': remotePath,
      'displayDuration': displayDuration,
      'order': order,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'scheduledEndDate': scheduledEndDate?.toIso8601String(),
      'fileSize': fileSize,
    };
  }

  MediaModel copyWith({
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
    return MediaModel(
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
