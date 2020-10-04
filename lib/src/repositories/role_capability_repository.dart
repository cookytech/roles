
import 'package:meta/meta.dart';
import 'package:roles/src/interfaces/role_capability.dart';

abstract class _RoleCapabilityRepositoryInterface {
  ///We can initialize it with a map of roles to capabilities
  void init(Map<String, List<String>> rolesToCapabilites);

  /// We can add capabilities to a role at runtime
  void addCapabilitiesToRole(
      {@required String role, @required List<RoleCapability> capabilities});

  /// We can remove capabilities from a role at runtime

  /// We can list the capabilties in a role at runtime
}

class RoleCapabilityRepository implements _RoleCapabilityRepositoryInterface {
  static final RoleCapabilityRepository _instance =
      RoleCapabilityRepository._internal();
  factory RoleCapabilityRepository() => _instance;
  RoleCapabilityRepository._internal();
}
