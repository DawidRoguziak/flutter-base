import 'package:auto_route/annotations.dart';
import 'package:my_finance_calculator/pages/PageSplash.dart';
import 'package:my_finance_calculator/pages/auth/PageAuth.dart';
import 'package:my_finance_calculator/pages/auth/PageSignIn.dart';
import 'package:my_finance_calculator/pages/repos/PageStarredRepos.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: PageSplash, initial: true),
  MaterialRoute(page: PageSignIn, path: '/sign-in'),
  MaterialRoute(page: PageStarredRepos, path: '/starred'),
  MaterialRoute(page: PageAuthorization, path: '/auth'),
])
class $AppRouter {}
