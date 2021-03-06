import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RoleCapability extends Equatable{
  final String capability;
  final String errorMessage;

  RoleCapability({
    @required this.capability,
    this.errorMessage = 'Capability not available to the current role',
  });

  @override
  List<Object> get props => [capability];
}
