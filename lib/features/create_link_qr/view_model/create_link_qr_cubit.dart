import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/create_link_qr_repo.dart';

part 'create_link_qr_state.dart';
class CreateLinkQrCubit extends Cubit<CreateLinkQrState> {
  final CreateLinkQrRepo create_link_qrRepo;
  CreateLinkQrCubit(this.create_link_qrRepo) : super(const CreateLinkQrInitial());
}
