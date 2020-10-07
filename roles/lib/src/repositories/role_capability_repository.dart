import 'package:meta/meta.dart';
import 'package:roles/src/types/role_capability.dart';
import 'package:roles/src/types/role_user.dart';

abstract class _RoleCapabilityRepositoryInterface {
  ///We can initialize it with a map of roles to capabilities
  void init(Map<String, List<RoleCapability>> rolesToCapabilites);

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

  /// Take a [RoleUser], take a [RoleCapability] and return whether
  /// user has that capability or not
  bool doesUserHaveCapability(RoleUser user, RoleCapability capability);
}

class RoleCapabilityRepository implements _RoleCapabilityRepositoryInterface {
  static final RoleCapabilityRepository _instance =
      RoleCapabilityRepository._internal();
  factory RoleCapabilityRepository() => _instance;
  RoleCapabilityRepository._internal();

  Map<String, List<RoleCapability>> rolesAndCapabilties = {};

  @override
  void addCapabilitiesToRole({String role, List<RoleCapability> capabilities}) {
    if (rolesAndCapabilties[role] == null) {
      rolesAndCapabilties[role] = capabilities;
    } else {
      rolesAndCapabilties[role].addAll(capabilities);
    }
    return;
  }

  @override
  List<RoleCapability> getCapabilitiesForRole(String role) {
    return rolesAndCapabilties[role].toSet().toList();
  }

  @override
  List<RoleCapability> getCapabilitiesForUser(RoleUser roleUser) {
    return rolesAndCapabilties[roleUser.role].toSet().toList();
  }

  @override
  void init(Map<String, List<RoleCapability>> rolesAndCapabilites) {
    rolesAndCapabilties = rolesAndCapabilites;
  }

  @override
  void removeCapabilitiesFromRole(
      {String role, List<RoleCapability> capabilities}) {
    (rolesAndCapabilties[role] ?? [])
      ..removeWhere((element) => capabilities.contains(element));
    return;
  }

  @override
  bool doesUserHaveCapability(RoleUser user, RoleCapability capability) {
    return (rolesAndCapabilties[user.role] ?? []).contains(capability);
  }
}
