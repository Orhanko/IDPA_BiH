class EventModel {
  final String name;
  final String startDate;
  final String endDate;
  final String tier;
  final String phone;
  final String imgUrl;
  final String practiscoreUrl;
  final Details details;
  final Hotel hotel;
  final ShootingRange shootingRange;
  final VisitSuggestion visitSuggestion;
  final List<AgendaItem> agenda;

  EventModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.tier,
    required this.phone,
    required this.imgUrl,
    required this.practiscoreUrl,
    required this.details,
    required this.hotel,
    required this.shootingRange,
    required this.visitSuggestion,
    required this.agenda,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      name: json['name'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      tier: json['tier'],
      phone: json['phone'],
      imgUrl: json['imgUrl'],
      practiscoreUrl: json['practiscoreUrl'],
      details: Details.fromJson(json['details']),
      hotel: Hotel.fromJson(json['hotel']),
      shootingRange: ShootingRange.fromJsoncic(json['shootingRange']),
      visitSuggestion: VisitSuggestion.fromJson(json['visitSuggestion']),
      agenda:
          (json['agenda'] as List)
              .map((item) => AgendaItem.fromJson(item))
              .toList(),
    );
  }
}

class AgendaItem {
  final String name;
  final String title;
  final List<String> infoList;

  AgendaItem({required this.name, required this.title, required this.infoList});

  factory AgendaItem.fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      name: json['name'],
      title: json['title'],
      infoList: List<String>.from(json['infoList']),
    );
  }
}

class Details {
  final String startTime;
  final String endTime;
  final String level;
  final String matchFee;
  final String minRounds;
  final String stages;
  final String tier;

  Details({
    required this.startTime,
    required this.endTime,
    required this.level,
    required this.matchFee,
    required this.minRounds,
    required this.stages,
    required this.tier,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      startTime: json['startTime'],
      endTime: json['endTime'],
      level: json['level'],
      matchFee: json['matchFee'],
      minRounds: json['minRounds'],
      stages: json['stages'],
      tier: json['tier'],
    );
  }
}

class Hotel {
  final String name;
  final String placeId;

  Hotel({required this.name, required this.placeId});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(name: json['name'], placeId: json['placeId']);
  }
}

class ShootingRange {
  final String name;
  final String address;
  final String placeId;
  final Location location;

  ShootingRange({
    required this.name,
    required this.address,
    required this.placeId,
    required this.location,
  });

  factory ShootingRange.fromJsoncic(Map<String, dynamic> json) {
    return ShootingRange(
      name: json['name'],
      address: json['address'],
      placeId: json['placeId'],
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final String lat;
  final String lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'], lng: json['lng']);
  }
}

class VisitSuggestion {
  final String name;
  final String imageUrl;
  final String visitUrl;

  VisitSuggestion({
    required this.name,
    required this.imageUrl,
    required this.visitUrl,
  });

  factory VisitSuggestion.fromJson(Map<String, dynamic> json) {
    return VisitSuggestion(
      name: json['name'],
      imageUrl: json['imageUrl'],
      visitUrl: json['visitUrl'],
    );
  }
}
