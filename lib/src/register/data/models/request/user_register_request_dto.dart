import '../../../domain/entities/user_entity.dart';

class UserRegisterRequestDto extends UserEntity {
  UserRegisterRequestDto({
    required super.userId,
    required super.userEmail,
    required super.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}
