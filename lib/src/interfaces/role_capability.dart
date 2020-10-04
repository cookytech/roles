class RoleCapability {
  final String capability;
  final String errorMessage;

  RoleCapability({
    this.capability,
    this.errorMessage = 'Capability not available to the current role',
  });
}
