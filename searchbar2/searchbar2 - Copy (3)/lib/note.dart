class Note {
  int id;
  String _pen_id;
  String _name;
  String _Address;
  String _Adhar;
  String _phone;
  String _amount;
  String _image;

  Note(this.id,this._pen_id,this._name,this._Address,this._Adhar,this._phone,this._amount,this._image);
//  Note.fromMap(Map<String, dynamic> map) {
//    _id = map['id'];
//    _pen_id = map['pen_id'];
//    _name = map['name'];
//    _Address = map['Address'];
//    _Adhar = map['Adhar'];
//    _phone = map['phone'];
//    _amount = map['amount'];
//    _image = map['image'];
//  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'pen_id': _pen_id,
      'name': _name,
      'Address': _Address,
      'Adhar': _Adhar,
      'phone': _phone,
      'amount': _amount,
      'image': _image,
    };
    return map;
  }

}