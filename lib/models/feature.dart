/// Station
class Feature {
  int? id;
  String? type;
  Properties? properties;
  Geometry? geometry;

  Feature({this.id, this.type, this.properties, this.geometry});

  Feature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

/// Station Data
class Properties {
  int? id;
  String? name;
  String? address;
  String? description;
  String? logoUrl;
  bool? cashBackIsActive;

  Properties(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.logoUrl,
      this.cashBackIsActive});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    logoUrl = json['logo_url'];
    cashBackIsActive = json['cashBackIsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['logo_url'] = this.logoUrl;
    return data;
  }
}

/// Station Location on the map
class Geometry {
  String? type;
  List<dynamic>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
