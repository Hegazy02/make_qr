import '../../core/apis/network_helper.dart';
import 'main_repo.dart';

class MainRepoImpl extends MainRepo {
  final NetworkHelper _networkHelper;
  const MainRepoImpl(this._networkHelper);
}
