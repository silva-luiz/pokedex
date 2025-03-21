import 'package:mobx/mobx.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

part 'auth_viewmodel.g.dart';

class AuthViewmodel = _AuthViewmodelBase with _$AuthViewmodel;

abstract class _AuthViewmodelBase with Store {
  final AuthRepository _authRepository;

  _AuthViewmodelBase(this._authRepository);

  @observable
  UserEntity? _currentUser;

  @computed
  UserEntity? get currentUser => _currentUser;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @action
  Future<void> signIn(String email, String password) async {
    _isLoading = true;

    try {
      _currentUser =
          await _authRepository.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> signOut() async {
    await _authRepository.signOut();
    _currentUser = null;
  }
}
