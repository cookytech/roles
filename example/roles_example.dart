import 'package:roles/roles.dart';
import 'package:roles/src/interfaces/role_capability.dart';
import 'package:roles/src/repositories/role_capability_repository.dart';
import 'package:roles/src/role_guard/role_guard.dart';

/// Make sure your user class implements a roleUser
class User implements RoleUser {
  @override
  final String role;
  final String name;

  User(this.name, this.role);
}

void main(List<String> args) {
  RoleCapabilityRepository().init({
    'admin': [
      RoleCapability(capability: 'add new user'),
      RoleCapability(capability: 'remove existing user'),
    ],
    'public': []
  });

  var raveesh = User('Raveesh', 'admin');
  var sayan = User('Sayan', 'public');

  var deleteAUser = (User user) {
    print('${user.name} removed');
  };

  var removeUserGuard = RoleGuard(capabilitiesIncludedIn: [
    RoleCapability(capability: 'remove existing user')
  ]);

  removeUserGuard.call(raveesh, () => deleteAUser(sayan));
  removeUserGuard.call(sayan, () => deleteAUser(raveesh));
}
