import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/qr_type.dart';
import '../../../core/enums/status_enum.dart';
import '../../main/model/qr_model.dart';
import '../repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState(Status.initial));
  List<QrModel> qrTypes = [
    const QrModel(
        type: QrType.text, image: 'assets/icons/text_icon.png', data: ''),
    const QrModel(
        type: QrType.url, image: 'assets/icons/url_icon.png', data: ''),
    const QrModel(
        type: QrType.pdf, image: 'assets/icons/pdf_icon.png', data: ''),
  ];
}
