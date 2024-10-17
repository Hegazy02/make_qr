import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/qr_type.dart';
import '../../../core/enums/status_enum.dart';
import '../../create_image_qr/view/create_image_qr_view.dart';
import '../../create_link_qr/view/create_link_qr_view.dart';
import '../../create_pdf_qr/view/create_pdf_qr_view.dart';
import '../../create_phone_number_qr/view/create_phone_number_qr_view.dart';
import '../../main/model/qr_model.dart';
import '../repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState(Status.initial));

  List qrTypes = [
    {
      "qrModel": const QrModel(
          type: QrType.url, image: 'assets/icons/url_icon.png', data: ''),
      "route": CreateLinkQrView.createLinkQr,
    },
    {
      "qrModel": const QrModel(
          type: QrType.image, image: 'assets/icons/image_icon.png', data: ''),
      "route": CreateImageQrView.createImageQr,
    },
    {
      "qrModel": const QrModel(
          type: QrType.pdf, image: 'assets/icons/pdf_icon.png', data: ''),
      "route": CreatePdfQrView.createPdfQr,
    },
    {
      "qrModel": const QrModel(
          type: QrType.phoneNumber,
          image: 'assets/icons/phone_icon.png',
          data: ''),
      "route": CreatePhoneNumberQrView.createPhoneNumberQr,
    },
  ];
}
