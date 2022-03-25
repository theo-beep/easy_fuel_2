class orderHistory {
  late final DateTime Date;
  late final String Uid;
  late final double cost;
  late final delivery_cost;
  late final double longitude;
  late final double latitude;
  late final int status;
  late final double total;
  late final String type;

  orderHistory.name(this.Date, this.Uid, this.cost, this.delivery_cost,
      this.longitude, this.latitude, this.status, this.total, this.type);


  orderHistory.fromJson(Map<String, dynamic> json)
      : Uid = json['Uid'],
        Date = json['Date'],
        type= json['type'],
        status = json['status'],
        longitude= json['longitude'],
        latitude= json['latitude'],
        cost= json['cost'],
        delivery_cost = json['delivery cost'],
        total = json['total'];


  //    'Uid' : auth.currentUser?.uid,
//     'Date': date,
//     'type' : 'Petrol 91',
//     'status' : '0',
//     'longitude':position?.longitude,
//     'latitude':position?.latitude,
//     'cost': cost,
//     'delivery cost': cost*0.15,
//     'total': cost*1.15
}
