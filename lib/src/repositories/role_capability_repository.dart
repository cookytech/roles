import 'package:meta/meta.dart';
import 'package:roles/src/interfaces/role_capability.dart';
import 'package:roles/src/interfaces/role_user.dart';

abstract class _RoleCapabilityRepositoryInterface {
  ///We can initialize it with a map of roles to capabilities
  void init(Map<String, List<String>> rolesToCapabilites);

  /// We can add capabilities to a role at runtime
  void addCapabilitiesToRole(
      {@required String role, @required List<RoleCapability> capabilities});

  /// We can remove capabilities from a role at runtime
  void removeCapabilitiesFromRole(
      {@required String role, @required List<RoleCapability> capabilities});

  /// We can list the capabilties in a role at runtime
  List<RoleCapability> getCapabilitiesForRole(String role);

  /// We can also list capabilties for a user at runtime
  List<RoleCapability> getCapabilitiesForUser(RoleUser roleUser);
}

class RoleCapabilityRepository implements _RoleCapabilityRepositoryInterface {
  static final RoleCapabilityRepository _instance =
      RoleCapabilityRepository._internal();
  factory RoleCapabilityRepository() => _instance;
  RoleCapabilityRepository._internal();

  final Map<String, List<String>> rolesAndCapabilties = {};

  @override
  void addCapabilitiesToRole({String role, List<RoleCapability> capabilities}) {
    // TODO: implement addCapabilitiesToRole
  }

  @override
  List<RoleCapability> getCapabilitiesForRole(String role) {
    // TODO: implement getCapabilitiesForRole
    throw UnimplementedError();
  }

  @override
  List<RoleCapability> getCapabilitiesForUser(RoleUser roleUser) {
    // TODO: implement getCapabilitiesForUser
    throw UnimplementedError();
  }

  @override
  void init(Map<String, List<String>> rolesToCapabilites) {}

  @override
  void removeCapabilitiesFromRole(
      {String role, List<RoleCapability> capabilities}) {
    // TODO: implement removeCapabilitiesFromRole
  }
}
