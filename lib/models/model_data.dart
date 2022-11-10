const tableContact = 'tbl_contact';
const tableContactColId = 'id';
const tableContactColName = 'name';
const tableContactColPhone = 'phone';
const tableContactColAddress = 'address';
const tableContactColGender = 'gender';
const tableContactColDob = 'dob';
const tableContactColImage = 'images';

class ModelData {
  String? id;
  String name;
  String phone;
  String? address;
  String? gender;
  String? dob;
  String? images;

  ModelData(
      {this.id,
      required this.name,
      required this.phone,
      this.address,
      this.dob,
      this.gender,
      this.images});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableContactColName: name,
      tableContactColPhone: phone,
      tableContactColAddress: address,
      tableContactColGender: gender,
      tableContactColDob: dob,
      tableContactColImage: images
    };
    return map;
  }

  factory ModelData.fromMap(Map<String, dynamic> map) => ModelData(
      id: map[tableContactColId],
      name: map[tableContactColName],
      phone: map[tableContactColPhone],
      address: map[tableContactColAddress],
      dob: map[tableContactColDob],
      gender: map[tableContactColGender],
      images: map[tableContactColImage]);
}
