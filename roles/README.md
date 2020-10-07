# Roles 
A user role management and capability guarding library for Dart Developers

## Motivation
Any application complex enough will have multiple user roles with multiple access permissions.
This library should be specially beneficial for backend developers who want to implement role 
based guards on functions.

## Usage

### [RoleUser]
Make your user implement `RoleUser` interface. This ensures that the user has a `role` getter.
This `role` is a String type. We can represent this internally using enums as well.

example:
```
class User implements RoleUser {
  @override
  final String role;
  final String name;

  User(this.name, this.role);
}

```

### RoleCapability
A concrete class that takes in a capability string, and an error message which needs to be shown 
if the user lacks the role corresponding to the capability. 
Functions are guarded by a list of capabilities. 

```
  RoleCapability({
    @required this.capability,
    this.errorMessage = 'Capability not available to the current role',
  });
```

### RoleCapabilityRepository
A singleton that stores a mapping of Roles to a list of  [RoleCapability]
This also exposes helper methods to get `capabilities` for a Role or a `RoleUser`

```
abstract class _RoleCapabilityRepositoryInterface {
  ///We can initialize it with a map of roles to capabilities
  void init(Map<String, List<RoleCapability>> rolesToCapabilities);

  /// We can add capabilities to a role at runtime
  void addCapabilitiesToRole(
      {@required String role, @required List<RoleCapability> capabilities});

  /// We can remove capabilities from a role at runtime
  void removeCapabilitiesFromRole(
      {@required String role, @required List<RoleCapability> capabilities});

  /// We can list the capabilities in a role at runtime
  List<RoleCapability> getCapabilitiesForRole(String role);

  /// We can also list capabilities for a user at runtime
  List<RoleCapability> getCapabilitiesForUser(RoleUser roleUser);

  /// Take a [RoleUser], take a [RoleCapability] and return whether
  /// user has that capability or not
  bool doesUserHaveCapability(RoleUser user, RoleCapability capability);
}
```
### RoleGuard
Initial motivation was to encapsulate the function within the guard. 
Dart 2 dropped support for varargs, so we could not figure out a way to pass 
the arguments as is to the encapsulated function. 

This is an area in which we intend to improve, till then we inject the function into the
guard on runtime.

We also need to figure out a way to return from the RoleGuard

```
var removeUserGuard = RoleGuard(capabilitiesIncludedIn: [
    RoleCapability(capability: 'remove existing user')
  ]);

  removeUserGuard.call(raveesh, () => deleteAUser(sayan));
```


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/cookytech/roles/issues
