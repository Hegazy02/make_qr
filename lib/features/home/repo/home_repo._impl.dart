import '../../../core/apis/network_helper.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final NetworkHelper _networkHelper;

  HomeRepoImpl(this._networkHelper);
}
