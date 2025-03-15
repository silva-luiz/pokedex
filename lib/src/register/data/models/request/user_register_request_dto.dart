import '../../../domain/entities/user_entity.dart';

class UserRegisterRequestDto extends UserEntity {
  UserRegisterRequestDto({
    required super.userEmail,
    required super.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}
