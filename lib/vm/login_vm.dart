import 'package:kpn_pos_application/blocs/login_bloc.dart';

class LoginViewModel {
  final LoginBloc loginBloc;

  LoginViewModel(this.loginBloc);

  void login(String username, String password) {
    loginBloc.add(LoginButtonPressed(username, password));
  }
}
