import 'package:roles/roles.dart';
import 'package:roles/src/role_guard/role_guard.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:roles/src/roles_base.dart';

class MockRoleUser extends Mock implements RoleUser {}

void main() {
  group('Role Guard..', () {
    test('Can Instantiate', () {
      expect(RoleGuard(), isNotNull);
    });
    test(
        'If RoleCapabity Repository does not have capability for the Role, throws',
        () {
      var user = MockRoleUser();
      when(user.role).thenReturn('not_batch_counter');
      expect(
          RoleGuard(capabilitiesIncludedIn: [
            RoleCapability(capability: 'count_batches')
          ]).call(MockRoleUser(), () => print('Halua')),
          throwsA(Exception()));
    });
  });
}
