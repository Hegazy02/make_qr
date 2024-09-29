import '../../../core/apis/network_helper.dart';
import 'scanner_repo.dart';

class ScannerRepoImpl extends ScannerRepo {
  final NetworkHelper _networkHelper;
  const ScannerRepoImpl(this._networkHelper);
}
