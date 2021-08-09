import 'package:equatable/equatable.dart';

class AuthUser extends Equatable{
  final String? uid;
  final String? email;
  AuthUser(this.uid, this.email);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> singInAnonymously();

  Future<AuthUser?> createUserWithEmailAndPassword(String email,
      String password);

  Future<AuthUser?> SignWithEmailAndPassword(String email, String password);

  Future<void> singOut();
}
