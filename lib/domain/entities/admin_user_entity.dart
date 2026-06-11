import 'package:equatable/equatable.dart';

enum AdminRole { superAdmin, admin, moderator }

class AdminUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final AdminRole role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastLogin;

  const AdminUserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.lastLogin,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    role,
    isActive,
    createdAt,
    updatedAt,
    lastLogin,
  ];

  AdminUserEntity copyWith({
    String? id,
    String? email,
    String? name,
    AdminRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLogin,
  }) {
    return AdminUserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }
}
