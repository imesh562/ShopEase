import 'package:shopease/features/data/datasources/shared_preference.dart';
import 'package:shopease/features/domain/repositories/repository.dart';
import 'package:shopease/utils/device_info.dart';
import 'package:meta/meta.dart';

import '../base_bloc.dart';
import '../base_event.dart';
import '../base_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Base<AuthEvent, BaseState<AuthState>> {
  final AppSharedData appSharedData;
  final Repository repository;
  final DeviceInfo deviceInfo;

  AuthBloc({
    required this.appSharedData,
    required this.repository,
    required this.deviceInfo,
  }) : super(AuthInitial()) {}
}
