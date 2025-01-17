import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String email;
  String? phoneNumber;
  String? address;
  List<String> deliveryAddresses;
  String? defaultDeliveryAddress;
  DateTime? dateOfBirth;
  String? gender;
  String? avatarUrl;
  bool isProfileComplete;
  DateTime createdAt;
  DateTime? lastUpdated;
  
  bool notificationsEnabled;
  String? preferredPaymentMethod;
  List<String> dietaryPreferences;
  String? languagePreference;
  
  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.address,
    this.deliveryAddresses = const [],
    this.defaultDeliveryAddress,
    this.dateOfBirth,
    this.gender,
    this.avatarUrl,
    this.isProfileComplete = false,
    required this.createdAt,
    this.lastUpdated,
    this.notificationsEnabled = true,
    this.preferredPaymentMethod,
    this.dietaryPreferences = const [],
    this.languagePreference,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> data) {
    return UserModel(
      uid: uid,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      deliveryAddresses: List<String>.from(data['deliveryAddresses'] ?? []),
      defaultDeliveryAddress: data['defaultDeliveryAddress'],
      dateOfBirth: data['dateOfBirth'] != null ? (data['dateOfBirth'] as Timestamp).toDate() : null,
      gender: data['gender'],
      avatarUrl: data['avatarUrl'],
      isProfileComplete: data['isProfileComplete'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      lastUpdated: data['lastUpdated'] != null ? (data['lastUpdated'] as Timestamp).toDate() : null,
      notificationsEnabled: data['notificationsEnabled'] ?? true,
      preferredPaymentMethod: data['preferredPaymentMethod'],
      dietaryPreferences: List<String>.from(data['dietaryPreferences'] ?? []),
      languagePreference: data['languagePreference'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'deliveryAddresses': deliveryAddresses,
      'defaultDeliveryAddress': defaultDeliveryAddress,
      'dateOfBirth': dateOfBirth != null ? Timestamp.fromDate(dateOfBirth!) : null,
      'gender': gender,
      'avatarUrl': avatarUrl,
      'isProfileComplete': isProfileComplete,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastUpdated': lastUpdated != null ? Timestamp.fromDate(lastUpdated!) : null,
      'notificationsEnabled': notificationsEnabled,
      'preferredPaymentMethod': preferredPaymentMethod,
      'dietaryPreferences': dietaryPreferences,
      'languagePreference': languagePreference,
    };
  }

  // 创建用户模型的副本并更新属性
  UserModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? address,
    List<String>? deliveryAddresses,
    String? defaultDeliveryAddress,
    DateTime? dateOfBirth,
    String? gender,
    String? avatarUrl,
    bool? isProfileComplete,
    DateTime? lastUpdated,
    bool? notificationsEnabled,
    String? preferredPaymentMethod,
    List<String>? dietaryPreferences,
    String? languagePreference,
  }) {
    return UserModel(
      uid: uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      deliveryAddresses: deliveryAddresses ?? this.deliveryAddresses,
      defaultDeliveryAddress: defaultDeliveryAddress ?? this.defaultDeliveryAddress,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      createdAt: createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      preferredPaymentMethod: preferredPaymentMethod ?? this.preferredPaymentMethod,
      dietaryPreferences: dietaryPreferences ?? this.dietaryPreferences,
      languagePreference: languagePreference ?? this.languagePreference,
    );
  }
} 