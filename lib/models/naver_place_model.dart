class NaverPlaceModel {
  String? id;
  String? name;
  String? tel;
  String? virtualTel;
  List<String>? category;
  String? address;
  String? roadAddress;
  String? abbrAddress;
  // List<String>? shortAddress;
  String? display;
  String? telDisplay;
  List<String>? context;
  int? reviewCount;
  int? placeReviewCount;
  String? thumUrl;
  List<String>? thumUrls;
  String? x;
  String? y;
  bool? isAdultBusiness;
  String? homePage;
  String? description;
  bool? isPollingPlace;
  String? bizhourInfo;
  String? menuInfo;
  ReservationLabel? reservationLabel;
  Reservation? reservation;
  bool? hasNPay;
  Null? parkingPrice;
  Null? card;
  String? distance;
  String? marker;
  String? markerSelected;
  String? markerId;
  List<String>? microReview;
  Null? michelinGuide;

  NaverPlaceModel(
      {this.id,
        this.name,
        this.tel,
        this.virtualTel,
        this.category,
        this.address,
        this.roadAddress,
        this.abbrAddress,
        // this.shortAddress,
        this.display,
        this.telDisplay,
        this.context,
        this.reviewCount,
        this.placeReviewCount,
        this.thumUrl,
        this.thumUrls,
        this.x,
        this.y,
        this.isAdultBusiness,
        this.homePage,
        this.description,
        this.isPollingPlace,
        this.bizhourInfo,
        this.menuInfo,
        this.reservationLabel,
        this.reservation,
        this.hasNPay,
        this.parkingPrice,
        this.card,
        this.distance,
        this.marker,
        this.markerSelected,
        this.markerId,
        this.microReview,
        this.michelinGuide});

  NaverPlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
    virtualTel = json['virtualTel'];
    category = json['category'].cast<String>();
    address = json['address'];
    roadAddress = json['roadAddress'];
    abbrAddress = json['abbrAddress'];
    // shortAddress = json['shortAddress'] != null ? json['shortAddress'].cast<String>() : "";
    display = json['display'];
    telDisplay = json['telDisplay'];
    context = json['context'].cast<String>();
    reviewCount = json['reviewCount'];
    placeReviewCount = json['placeReviewCount'];
    thumUrl = json['thumUrl'];
    thumUrls = json['thumUrls'].cast<String>();
    x = json['x'];
    y = json['y'];
    isAdultBusiness = json['isAdultBusiness'];
    homePage = json['homePage'];
    description = json['description'];
    isPollingPlace = json['isPollingPlace'];
    bizhourInfo = json['bizhourInfo'];
    menuInfo = json['menuInfo'];
    reservationLabel = json['reservationLabel'] != null
        ? new ReservationLabel.fromJson(json['reservationLabel'])
        : null;
    reservation = json['reservation'] != null
        ? new Reservation.fromJson(json['reservation'])
        : null;
    hasNPay = json['hasNPay'];
    parkingPrice = json['parkingPrice'];
    card = json['card'];
    distance = json['distance'];
    marker = json['marker'];
    markerSelected = json['markerSelected'];
    markerId = json['markerId'];
    microReview = json['microReview'].cast<String>();
    michelinGuide = json['michelinGuide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['virtualTel'] = this.virtualTel;
    data['category'] = this.category;
    data['address'] = this.address;
    data['roadAddress'] = this.roadAddress;
    data['abbrAddress'] = this.abbrAddress;
    // data['shortAddress'] = this.shortAddress;
    data['display'] = this.display;
    data['telDisplay'] = this.telDisplay;
    data['context'] = this.context;
    data['reviewCount'] = this.reviewCount;
    data['placeReviewCount'] = this.placeReviewCount;
    data['thumUrl'] = this.thumUrl;
    data['thumUrls'] = this.thumUrls;
    data['x'] = this.x;
    data['y'] = this.y;
    data['isAdultBusiness'] = this.isAdultBusiness;
    data['homePage'] = this.homePage;
    data['description'] = this.description;
    data['isPollingPlace'] = this.isPollingPlace;
    data['bizhourInfo'] = this.bizhourInfo;
    data['menuInfo'] = this.menuInfo;
    if (this.reservationLabel != null) {
      data['reservationLabel'] = this.reservationLabel!.toJson();
    }
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    data['hasNPay'] = this.hasNPay;
    data['parkingPrice'] = this.parkingPrice;
    data['card'] = this.card;
    data['distance'] = this.distance;
    data['marker'] = this.marker;
    data['markerSelected'] = this.markerSelected;
    data['markerId'] = this.markerId;
    data['microReview'] = this.microReview;
    data['michelinGuide'] = this.michelinGuide;
    return data;
  }
}

class ReservationLabel {
  bool? standard;
  bool? preOrder;
  bool? table;
  bool? takeout;

  ReservationLabel({this.standard, this.preOrder, this.table, this.takeout});

  ReservationLabel.fromJson(Map<String, dynamic> json) {
    standard = json['standard'];
    preOrder = json['preOrder'];
    table = json['table'];
    takeout = json['takeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standard'] = this.standard;
    data['preOrder'] = this.preOrder;
    data['table'] = this.table;
    data['takeout'] = this.takeout;
    return data;
  }
}

class Reservation {
  String? benefit;

  Reservation({this.benefit});

  Reservation.fromJson(Map<String, dynamic> json) {
    benefit = json['benefit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['benefit'] = this.benefit;
    return data;
  }
}