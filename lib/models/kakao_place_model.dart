import 'package:flutter/material.dart';

class KakaoPlace {
  String? addressName;
  String? categoryGroupCode;
  String? categoryGroupName;
  String? categoryName;
  String? distance;
  String? id;
  String? phone;
  String? placeName;
  String? placeUrl;
  String? roadAddressName;
  String? x;
  String? y;

  KakaoPlace(
      {this.addressName,
        this.categoryGroupCode,
        this.categoryGroupName,
        this.categoryName,
        this.distance,
        this.id,
        this.phone,
        this.placeName,
        this.placeUrl,
        this.roadAddressName,
        this.x,
        this.y});

  KakaoPlace.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    categoryGroupCode = json['category_group_code'];
    categoryGroupName = json['category_group_name'];
    categoryName = json['category_name'];
    distance = json['distance'];
    id = json['id'];
    phone = json['phone'];
    placeName = json['place_name'];
    placeUrl = json['place_url'];
    roadAddressName = json['road_address_name'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['category_group_code'] = this.categoryGroupCode;
    data['category_group_name'] = this.categoryGroupName;
    data['category_name'] = this.categoryName;
    data['distance'] = this.distance;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['place_name'] = this.placeName;
    data['place_url'] = this.placeUrl;
    data['road_address_name'] = this.roadAddressName;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
