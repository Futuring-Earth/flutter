// *** fromJson and toJson code generation... ***
//https://flutter.dev/docs/development/data-and-backend/json
// One-time code generation
// By running flutter pub run build_runner build in the project root, you
// generate JSON serialization code for your models whenever they are needed.
// This triggers a one-time build that goes through the source files, picks
// the relevant ones, and generates the necessary serialization code for them.

// While this is convenient, it would be nice if you did not have to run
// the build manually every time you make changes in your model classes.

// Generating code continuously
// A watcher makes our source code generation process more convenient.
// It watches changes in our project files and automatically builds the
// necessary files when needed. Start the watcher by running flutter pub
// run build_runner watch in the project root.

// It is safe to start the watcher once and leave it running in the background.

import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

import './base-model.dart';

/// This allows the `Checkin` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'checkin.g.dart';

//To automatically build the part classes
// flutter pub run build_runner build (one time build)
// flutter pub run build_runner watch (continuous build)

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Checkin extends BaseModel {
  @JsonKey(
      name: 'checkinDate', ignore: false, required: true, defaultValue: null)
  DateTime checkinDate;
  @JsonKey(
      name: 'challengeID', ignore: false, required: true, defaultValue: null)
  String challengeID;
  @JsonKey(name: 'userID', ignore: false, required: true, defaultValue: null)
  String userID;
  @JsonKey(
      name: 'unitsAchived', ignore: false, required: true, defaultValue: null)
  double unitsAchived;
  @JsonKey(name: 'unitType', ignore: false, required: true, defaultValue: null)
  String unitType;

  @override
  String id;
  @override
  String label;

  Checkin(
      {@required this.checkinDate,
      @required this.challengeID,
      @required this.userID,
      @required this.id,
      @required this.unitsAchived,
      @required this.unitType,
      label = 'checkin'});

  @override
  factory Checkin.fromJson(Map<String, dynamic> json) =>
      _$CheckinFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckinToJson(this);
}
