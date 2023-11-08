class FavouriteModel {
  FavouriteModel({
    required this.data,
    required this.links,
    required this.meta,
  });
  late final List<Data> data;
  late final Links links;
  late final Meta meta;
  
  FavouriteModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['links'] = links.toJson();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.phone,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.subDistrict,
    required this.isFavourited,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String address;
  late final String phone;
  late final String image;
  late final String latitude;
  late final String longitude;
  late final SubDistrict subDistrict;
  late final bool isFavourited;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    subDistrict = SubDistrict.fromJson(json['sub_district']);
    isFavourited = json['is_favourited'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['image'] = image;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['sub_district'] = subDistrict.toJson();
    _data['is_favourited'] = isFavourited;
    return _data;
  }
}

class SubDistrict {
  SubDistrict({
    required this.id,
    required this.name,
    required this.slug,
  });
  late final int id;
  late final String name;
  late final String slug;
  
  SubDistrict.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    return _data;
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
     this.prev,
     this.next,
  });
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;
  
  Links.fromJson(Map<String, dynamic> json){
    first = json['first'] ?? '';
    last = json['last'] ?? '';
    prev = null;
    next = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['last'] = last;
    _data['prev'] = prev;
    _data['next'] = next;
    return _data;
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;
  
  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}