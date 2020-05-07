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

import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'basemodel.g.dart';

//To automatically build the part classes
// flutter pub run build_runner build (one time build)
// flutter pub run build_runner watch (continuous build)
//   when the build fail try adding '--delete-conflicting-outputs'
//   at the end of the build command

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BaseModel {
  @JsonKey(name: 'id', ignore: false, required: true, defaultValue: null)
  final String id;
  @JsonKey(name: 'label', ignore: false, required: true, defaultValue: null)
  final String label;

  const BaseModel({this.id, this.label});

  // BaseModel.copy(BaseModel newModel) {
  //   id = newModel.id;
  //   label = newModel.label;
  // }

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  BaseModel fromJson(Map<String, dynamic> json) {
    return _$BaseModelFromJson(json);
  }
}
