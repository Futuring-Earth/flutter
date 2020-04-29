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

/// This allows the `Challenge` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'challenge.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Challenge extends BaseModel {
  @JsonKey(name: 'title', ignore: false, required: true, defaultValue: null)
  String title;
  @JsonKey(
      name: 'description', ignore: false, required: true, defaultValue: null)
  String description;
  @JsonKey(name: 'imageUrl', ignore: false, required: false, defaultValue: null)
  String imageUrl;
  @JsonKey(name: 'duration', ignore: false, required: false, defaultValue: null)
  int duration;
  @JsonKey(
      name: 'minTeamSize', ignore: false, required: true, defaultValue: null)
  int minTeamSize;
  @JsonKey(
      name: 'maxTeamSize', ignore: false, required: true, defaultValue: null)
  int maxTeamSize;
  @JsonKey(name: 'co2Impact', ignore: false, required: true, defaultValue: null)
  double co2Impact;
  @JsonKey(
      name: 'overallRaiting', ignore: false, required: true, defaultValue: null)
  double overallRaiting;
  @override
  String id;

  Challenge(
      {@required this.title,
      @required this.description,
      this.imageUrl,
      @required this.duration,
      @required this.minTeamSize,
      @required this.maxTeamSize,
      @required this.co2Impact,
      this.overallRaiting,
      this.id});

  Challenge.copy(Challenge newModel) : super.copy(newModel) {
    title = newModel.title;
    description = newModel.description;
  }

  @override
  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
