/// name : "Thành phố Hà Nội"
/// code : 1
/// division_type : "thành phố trung ương"
/// codename : "thanh_pho_ha_noi"
/// phone_code : 24
/// districts : []

class AddressResponse {
  AddressResponse({
      String name, 
      int code, 
      String divisionType, 
      String codename, 
      int phoneCode, 
      List<dynamic> districts,}){
    _name = name;
    _code = code;
    _divisionType = divisionType;
    _codename = codename;
    _phoneCode = phoneCode;
    _districts = districts;
}

  AddressResponse.fromJson(dynamic json) {
    _name = json['name'];
    _code = json['code'];
    _divisionType = json['division_type'];
    _codename = json['codename'];
    _phoneCode = json['phone_code'];
    if (json['districts'] != null) {
      _districts = [];
      json['districts'].forEach((v) {
        _districts.add(District.fromJson(v));
      });
    }
  }
  String _name;
  int _code;
  String _divisionType;
  String _codename;
  int _phoneCode;
  List<District> _districts;

  String get name => _name;
  int get code => _code;
  String get divisionType => _divisionType;
  String get codename => _codename;
  int get phoneCode => _phoneCode;
  List<dynamic> get districts => _districts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['code'] = _code;
    map['division_type'] = _divisionType;
    map['codename'] = _codename;
    map['phone_code'] = _phoneCode;
    if (_districts != null) {
      map['districts'] = _districts.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class District {
  District({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.provinceCode,
    this.wards,
  });

  String name;
  int code;
  DivisionType divisionType;
  String codename;
  int provinceCode;
  List<dynamic> wards;

  factory District.fromJson(Map<String, dynamic> json) => District(
    name: json["name"],
    code: json["code"],
    divisionType: divisionTypeValues.map[json["division_type"]],
    codename: json["codename"],
    provinceCode: json["province_code"],
    wards: List<dynamic>.from(json["wards"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "division_type": divisionTypeValues.reverse[divisionType],
    "codename": codename,
    "province_code": provinceCode,
    "wards": List<dynamic>.from(wards.map((x) => x)),
  };
}

enum DivisionType { THNH_PH, HUYN }
final divisionTypeValues = EnumValues({
  "huyện": DivisionType.HUYN,
  "thành phố": DivisionType.THNH_PH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
