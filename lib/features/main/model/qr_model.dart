import '../../../core/enums/qr_type.dart';

class QrModel {
  final QrType type;
  final String image;
  final String? data;
  final String? title;

  const QrModel({
    required this.type,
    required this.image,
    this.data,
    this.title,
  });

  QrModel copyWith({
    QrType? type,
    String? image,
    String? data,
    String? title,
  }) {
    return QrModel(
      type: type ?? this.type,
      image: image ?? this.image,
      data: data ?? this.data,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'image': image,
      'data': data,
      'title': title,
    };
  }

  factory QrModel.fromMap(Map<String, dynamic> map) {
    return QrModel(
      type: QrType.values.firstWhere((e) => e.name == map['type'] as String),
      image: map['image'] as String,
      data: map['data'] as String?,
      title: map['title'] as String?,
    );
  }
}
