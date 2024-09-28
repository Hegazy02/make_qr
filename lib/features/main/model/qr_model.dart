import '../../../core/enums/qr_type.dart';

class QrModel {
  final QrType type;
  final String image;
  final String? data;

  const QrModel({
    required this.type,
    required this.image,
    this.data,
  });

  QrModel copyWith({
    QrType? type,
    String? image,
    String? data,
  }) {
    return QrModel(
      type: type ?? this.type,
      image: image ?? this.image,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'image': image,
      'data': data,
    };
  }

  factory QrModel.fromMap(Map<String, dynamic> map) {
    return QrModel(
      type: QrType.values.firstWhere((e) => e.name == map['type'] as String),
      image: map['image'] as String,
      data: map['data'] as String?,
    );
  }
}
