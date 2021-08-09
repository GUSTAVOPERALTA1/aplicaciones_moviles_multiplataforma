import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/src/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;

  AuthCubit(this._authRepository): super(AuthInitialState());

  Future<void> init() async{
    await Future.delayed(Duration(seconds: 3));
    _authSubscription= _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }
  Future<void> reset() async => emit(AuthInitialState());

  void _authStateChanged(AuthUser? user) => user == null? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

  Future<void> singInAnonymously() => _singIn(_authRepository.singInAnonymously());

  Future<void> createUserWithEmailAndPassword(String email, String password) =>
      _singIn(_authRepository.createUserWithEmailAndPassword(email, password));

  Future<void> signInUserWithEmailAndPassword(String email, String password) =>
     _singIn(_authRepository.SignWithEmailAndPassword(email, password));

  Future<void> _singIn(Future<AuthUser?> auxUser) async{
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null){
        emit(AuthError('Error, intenta de nuevo'));
      }else{
        emit(AuthSignedIn(user));
      }
    }catch(e){
      emit(AuthError('Error: ${e.toString()}'));
    }
  }
  Future<void> signOut() async{
    await _authRepository.singOut();
    emit(AuthSignedOut());
  }
  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

}

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props =>[];
}

class AuthInitialState extends AuthState{
}


class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
  @override
  List<Object?> get props => [message];
}


class AuthSignedOut extends AuthState {}
class AuthSigningIn extends AuthState {}


class AuthSignedIn extends AuthState {
  final AuthUser user;
  AuthSignedIn(this.user);
  @override
  List<Object?> get props => [user];
}
