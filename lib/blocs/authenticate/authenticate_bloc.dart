import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'authenticate.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository}): assert(userRepository != null),
  _userRepository = userRepository;

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }else if (event is AdminAuthentication){
      yield* _mapAdminAuthenticationToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
      if (!isSignedIn) {
        await _userRepository.guest();
      }
      final userId = await _userRepository.getUserId();
      yield Authenticated(userId);
    } catch (_) {
      yield UnAuthenticated();
    }

  }

  Stream<AuthenticationState> _mapAdminAuthenticationToState() async*{
    try{
         await _userRepository.authenticate();
      final userId = await _userRepository.getUserId();
      yield Authenticated(userId); // here  diff state should be made say AuthAuthenticated
      // listener navigate
    }catch (_) {
      yield UnAuthenticated();  // here  diff state should be made say AuthUnAuthenticated
    }
  }

}