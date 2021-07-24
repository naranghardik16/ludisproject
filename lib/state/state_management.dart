// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/model/court_model.dart';
import 'package:flutter_firebase_login/model/facility_model.dart';
import 'package:flutter_firebase_login/model/hall_model.dart';
import 'package:flutter_firebase_login/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLogged = StateProvider((ref) => FirebaseAuth.instance.currentUser);
final userToken = StateProvider((ref) => '');
final forceReload = StateProvider((ref) => false);

final userInformation = StateProvider((ref) => UserModel());

//Booking state
final currentStep = StateProvider((ref) => 1);
final selectedHall = StateProvider((ref) => HallModel());
final selectedFacility = StateProvider((ref) => FacilityModel());
final selectedCourt = StateProvider((ref) => CourtModel());
final selectedDate = StateProvider((ref) => DateTime.now());
final selectedTimeSlot = StateProvider((ref) => -1);
final selectedTime = StateProvider((ref) => '');

//Delete Booking
final deleteFlagRefresh = StateProvider((ref) => false);
