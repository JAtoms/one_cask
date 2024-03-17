import 'dart:convert';

WineDetailsModel wineDetailsModelFromJson(String str) =>
    WineDetailsModel.fromJson(json.decode(str));

class WineDetailsModel {
  final WineData data;

  WineDetailsModel({
    required this.data,
  });

  factory WineDetailsModel.fromJson(Map<String, dynamic> json) =>
      WineDetailsModel(
        data: WineData.fromJson(json['data']),
      );
}

class WineData {
  final List<WineDetail> details;
  final TastingNotes tastingNotes;

  WineData({
    required this.details,
    required this.tastingNotes,
  });

  factory WineData.fromJson(Map<String, dynamic> json) => WineData(
        details: List<WineDetail>.from(
            json['details'].map((x) => WineDetail.fromJson(x))),
        tastingNotes: TastingNotes.fromJson(json['tasting_notes']),
      );
}

class WineDetail {
  final String type;
  final String value;

  WineDetail({
    required this.type,
    required this.value,
  });

  factory WineDetail.fromJson(Map<String, dynamic> json) => WineDetail(
        type: json['type'],
        value: json['value'],
      );
}

class TastingNotes {
  final String tastedBy;
  final String videoUrl;
  final String nose;
  final String palate;
  final String finish;

  TastingNotes({
    required this.tastedBy,
    required this.videoUrl,
    required this.nose,
    required this.palate,
    required this.finish,
  });

  factory TastingNotes.fromJson(Map<String, dynamic> json) => TastingNotes(
        tastedBy: json['tasted_by'],
        videoUrl: json['video_url'],
        nose: json['nose'],
        palate: json['palate'],
        finish: json['finish'],
      );
}
