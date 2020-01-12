class Houses {
  List<House> data;

  Houses({this.data});

  Houses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<House>();
      json['data'].forEach((v) {
        data.add(new House.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class House {
  String name;
  String price;
  Details details;

  House({this.name, this.price, this.details});

  House.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  String landArea;
  String landAreaSqft;
  String tenure;
  String baths;
  String beds;
  String tenureType;

  Details(
      {this.landArea,
      this.landAreaSqft,
      this.tenure,
      this.baths,
      this.beds,
      this.tenureType});

  Details.fromJson(Map<String, dynamic> json) {
    landArea = json['land_area'];
    landAreaSqft = json['land_area_sqft'];
    tenure = json['tenure'];
    baths = json['baths'];
    beds = json['beds'];
    tenureType = json['tenure_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['land_area'] = this.landArea;
    data['land_area_sqft'] = this.landAreaSqft;
    data['tenure'] = this.tenure;
    data['baths'] = this.baths;
    data['beds'] = this.beds;
    data['tenure_type'] = this.tenureType;
    return data;
  }
}