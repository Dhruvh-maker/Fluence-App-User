import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordWithEmail {
  final AuthRepository repository;

  ResetPasswordWithEmail(this.repository);

  Future<Either<Failure, void>> call(String email) async {
    return await repository.resetPasswordWithEmail(email);
  }
}
