class Store {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  Store(
      {this.addr,
        this.code,
        this.createdAt,
        this.lat,
        this.lng,
        this.name,
        this.remainStat,
        this.stockAt,
        this.type});


  //각 필드에 대응하는 JSON 키에서 값을 가져와 Store 클래스의 객체를 생성한다.
  Store.fromJson(Map<String, dynamic> json) {
    addr = json['addr']; //json 맵에서 addr 키에 해당하는 값을 가져와서 store 클래스의 addr 필드에 할당한다.
    code = json['code'];
    createdAt = json['created_at'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    remainStat = json['remain_stat'];
    stockAt = json['stock_at'];
    type = json['type'];
  }
}

