import 'package:roles/src/interfaces/role_capability.dart';
import 'package:roles/src/interfaces/role_user.dart';
import 'package:roles/src/repositories/role_capability_repository.dart';

class RoleGuard {
  final List<RoleCapability> capabilitiesIncludedIn;
  RoleGuard({this.capabilitiesIncludedIn});
  dynamic call(RoleUser user, Function function) {
    for (var capability in capabilitiesIncludedIn) {
      if (RoleCapabilityRepository().doesUserHaveCapability(user, capability)) {
        return function();
      }
    }
    throw Exception('RoleUser does not have the capability to call function');
  }
}
