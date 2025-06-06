class ContactModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String qrData;
  final DateTime createdAt;

  ContactModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.qrData,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'qrData': qrData,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      qrData: map['qrData'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
